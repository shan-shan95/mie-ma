class ItemsController < ApplicationController
  include ResponseStatus

  before_action :authenticate_user!, except: %i[index show]

  def index
    gon.items = Item.all.order(created_at: :desc)
  end

  def new
    gon.item = Item.new
    gon.item.seller_id = current_user.id
  end

  def create
    item = Item.new(item_params)
    if item.save
      return redirect_to root_path, notice: "出品しました"
    else
      return redirect_to new_item_path, alert: "出品に失敗しました"
    end
  end

  def show
    item = Item.joins(:seller).find(params[:id])

    return redirect_to trading_item_path(params[:id]) if user_signed_in? && current_user.is_trading?(item)
    item.update(view: item.view + 1) unless user_signed_in? && current_user.is_seller?(item)

    gon.item = item
    gon.item_images = item.images.map(&:service_url)
    gon.message = PublicMessage.new
    gon.seller_name = item.seller.name
    gon.is_seller = user_signed_in? && current_user.is_seller?(item)
    gon.user_id = current_user.id if user_signed_in?
    gon.user_name = current_user.name if user_signed_in?
    gon.public_messages = item.public_messages
  end

  def edit
    item = Item.find(params[:id])
    return redirect_to item_path(item.id), alert: "あなたには編集権限がありません" unless user_signed_in? && current_user.is_seller?(item) && item.now_on_sale?

    gon.item = item
  end

  def update
    item = Item.find(params[:id])
    return redirect_to item_path(item.id), alert: "あなたには編集権限がありません" unless user_signed_in? && current_user.is_seller?(item) && item.now_on_sale?
    if item.update(item_params)
      return redirect_to item_path(item), notice: "編集しました"
    else
      return redirect_to edit_item_path(item), alert: "編集に失敗しました"
    end
  end

  def destroy
    item = Item.find(params[:id])
    return redirect_to item_path(item.id), alert: "あなたには削除権限がありません" unless user_signed_in? && current_user.is_seller?(item) && item.now_on_sale?
    if item.destroy
      return redirect_to root_path, notice: "削除しました"
    else
      return redirect_to item_path(item), alert: "削除に失敗しました"
    end
  end

  def purchase
    item = Item.joins(:seller).find(params[:id])
    if current_user.is_trading?(item) || !item.now_on_sale?
      return redirect_to item_path(item.id), alert: "購入できませんでした"
    end

    item.update(buyer: current_user, trading_status: :trading)
    return redirect_to trading_item_path(item.id), notice: "購入できました"
  end

  def trading
    item = Item.find(params[:id])
    return redirect_to item_path(params[:id]) unless current_user.is_trading?(item)

    gon.item = item
    gon.message = PrivateMessage.new
    gon.seller_name = item.seller.name
    gon.is_seller = user_signed_in? && current_user.is_seller?(item)
    gon.is_buyer = current_user.is_buyer?(item)
    gon.user_id = current_user.id
    gon.user_name = current_user.name if user_signed_in?
    gon.private_messages = item.private_messages
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status, :seller_id, :price, images: [])
  end
end
