# frozen_string_literal: true

class ItemsController < ApplicationController
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
      redirect_to root_path, notice: '品物を作成しました'
    else
      redirect_to new_item_path, alert: item.errors.full_messages
    end
  end

  def show
    item = Item.joins(:seller).find(params[:id])
    item.update(view: item.view + 1) unless visited_user_is_seller?(item)

    gon.item = item
    gon.seller_name = item.seller.name
    gon.is_seller = visited_user_is_seller?(item)
  end

  def purchase
    item = Item.joins(:seller).find(params[:id])
    return redirect_to item_path(item.id), alert: '購入できませんでした' if visited_user_is_seller?(item) || item.buyer_id.present?
    item.update(buyer: current_user, trading_status: :trading)
    redirect_to item_path(item.id), notice: '購入できました'
  end

  private

  def item_params
    params[:item][:status] = params[:item][:status].to_i
    params.require(:item).permit(:name, :description, :status, :seller_id, :price)
  end

  def visited_user_is_seller?(item)
    item.seller == current_user
  end
end
