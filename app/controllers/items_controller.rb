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
      redirect_to root_path, notice: "品物を作成しました"
    else
      redirect_to new_item_path, alert: item.errors.full_messages
    end
  end

  def show
    item = Item.joins(:seller).find(params[:id])

    return redirect_to trading_item_path(params[:id]) if current_user.is_trading?(item)
    item.update(view: item.view + 1) unless current_user.is_seller?(item)

    gon.item = item
    gon.message = PublicMessage.new
    gon.seller_name = item.seller.name
    gon.is_seller = current_user.is_seller?(item)
    gon.user_id = current_user.id
    gon.public_messages = item.public_messages
  end

  def purchase
    item = Item.joins(:seller).find(params[:id])
    if current_user.is_trading?(item)
      return redirect_to item_path(item.id), alert: "購入できませんでした"
    end

    item.update(buyer: current_user, trading_status: :trading)
    redirect_to trading_item_path(item.id), notice: "購入できました"
  end

  def public_messages
    messages = Item.find(params[:id]).public_messages
    if messages
      render status: 200, json: messages.to_json
    else
      response_internal_server_error
    end
  end

  def private_messages
    item = Item.find(params[:id])
    return response_unauthorized until current_user.is_trader?(item)

    messages = item.private_messages
    if messages
      render status: 200, json: messages.to_json
    else
      response_internal_server_error
    end
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
