class AddBuyerIdIndexToItems < ActiveRecord::Migration[5.2]
  add_index :items, :buyer_id
  add_index :items, :seller_id
end
