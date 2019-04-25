# frozen_string_literal: true

class AddPriceToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :trading_status, :integer
    add_column :items, :price, :integer, null: false
  end
end
