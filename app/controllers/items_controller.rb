class ItemsController < ApplicationController
  include ResponseStatus

  before_action :authenticate_user!, except: %i[index show public_messages]

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
      return redirect_to root_path, notice: "品物を作成しました"
    else
      return redirect_to new_item_path, alert: item.errors.full_messages
    end
  end

  def show
    item = Item.joins(:seller).find(params[:id])

    return redirect_to trading_item_path(params[:id]) if user_signed_in? && current_user.is_trading?(item)
    item.update(view: item.view + 1) unless user_signed_in? && current_user.is_seller?(item)

    gon.item = item
    gon.message = PublicMessage.new
    gon.seller_name = item.seller.name
    gon.is_seller = user_signed_in? && current_user.is_seller?(item)
    gon.user_id = current_user.id if user_signed_in?
    gon.public_messages = item.public_messages
  end

  def purchase
    item = Item.joins(:seller).find(params[:id])
    if current_user.is_trading?(item)
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
    gon.user_id = current_user.id
    gon.private_messages = item.private_messages
  end

  private

  def item_params
    params[:item][:status] = params[:item][:status].to_i
    params.require(:item).permit(:name, :description, :status, :seller_id, :price)
  end
end
