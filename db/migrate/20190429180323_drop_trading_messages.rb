class DropTradingMessages < ActiveRecord::Migration[5.2]
  def up
    drop_table :trading_messages
  end

  def down
    create_table :trading_messages do |t|
      t.string :buyer_id
      t.string :seller_id
      t.string :item_id, null: false
      t.text :content, null: false, limit: 255
      t.integer :open_range, null: false
      t.timestamps
    end
    add_index :trading_messages, :item_id
  end
end
