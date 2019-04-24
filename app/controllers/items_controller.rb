# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    gon.items = Item.all
  end

  def new
    gon.item = Item.new
    gon.item.buyer_id = current_user.id
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path, notice: '作成しました'
    else
      render :new, flash.now[:alert] = @item.errors.full_messages
    end
  end

  def show
    gon.item = Item.find(params[:id])
  end

  private

  def item_params
    params[:item][:status] = params[:item][:status].to_i
    params.require(:item).permit(:name, :description, :status, :buyer_id)
  end
end
