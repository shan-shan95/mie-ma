class ChangeContentToTradingMessages < ActiveRecord::Migration[5.2]
  def change
    change_column :trading_messages, :content, :text, null: false
  end
end
