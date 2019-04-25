# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    gon.items = Item.all
  end

  def new
    gon.item = Item.new
    gon.item.seller_id = current_user.id
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path, notice: '作成しました'
    else
      render :new, flash.now[:alert] = item.errors.full_messages
    end
  end

  def show
    item = Item.joins(:seller).find(params[:id])
    item.update(view: item.view + 1)
    gon.item = item
    gon.seller_name = item.seller.name
  end

  private

  def item_params
    params[:item][:status] = params[:item][:status].to_i
    params.require(:item).permit(:name, :description, :status, :seller_id, :price)
  end
end
