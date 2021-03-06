class ItemsController < ApplicationController
  include ResponseStatus

  before_action :authenticate_user!, except: %i[index show]
  after_action :send_purchased_mail, only: %i[purchase]

  def index
    items = Item.all.order(created_at: :desc)
    gon.items = items.map(&:with_sumbnail_url)
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
    item.update(view: item.view + 1) unless user_signed_in? && current_user.is_trader?(item)

    gon.item = item.with_images_url
    gon.message = PublicMessage.new
    gon.seller_id = item.seller.id
    gon.seller_name = item.seller.nickname
    gon.is_seller = user_signed_in? && current_user.is_seller?(item)
    gon.public_messages = item.public_messages
    gon.user_id = current_user.id if user_signed_in?
    gon.user_name = current_user.nickname if user_signed_in?
  end

  def edit
    item = Item.find(params[:id])
    return redirect_to item_path(item.id), alert: "あなたには編集権限がありません" unless user_signed_in? && current_user.is_seller?(item) && item.now_on_sale?

    gon.item = item.with_images_url
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
    @item = Item.find(params[:id])
    if !@item.now_on_sale?
      return redirect_to item_path(@item.id), alert: "購入できませんでした"
    end

    return redirect_to trading_item_path(@item.id), notice: "購入しました" if @item.update(buyer: current_user, trading_status: :trading)
  end

  def trading
    item = Item.joins(:seller).find(params[:id])
    return redirect_to item_path(params[:id]), notice: "この商品は取引が完了しています" if item.completed?
    return redirect_to item_path(params[:id]), notice: "このページは出品者または購入者しか見れません" unless user_signed_in? && current_user.is_trading?(item)

    gon.item = item.with_images_url
    gon.private_messages = item.private_messages.map(&:with_sender)
    gon.message = PrivateMessage.new
    gon.is_completed_evaluation = current_user.is_completed_evaluation?(item)
    gon.be_evaluated_id = item.be_evaluated_id(current_user.id)
    gon.seller_id = item.seller.id
    gon.seller_name = item.seller.nickname
    gon.role = current_user.seller_or_buyer(item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status, :seller_id, :price, images: [])
  end

  def send_purchased_mail
    return unless @item.trading?

    ClientMailer.with(user: @item.buyer, item: @item).purchased_for_buyer.deliver_later
    ClientMailer.with(user: @item.seller, item: @item).purchased_for_seller.deliver_later
  end
end
