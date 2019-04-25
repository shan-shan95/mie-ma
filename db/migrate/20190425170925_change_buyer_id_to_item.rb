# frozen_string_literal: true

class ChangeBuyerIdToItem < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :buyer_id, null: true
    change_column :items, :seller_id, :string, null: false
  end
end
