class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.string :sender_id, null: false
      t.string :item_id, null: false
      t.text :content, null: false, limit: 255
      t.timestamps
    end

    add_index :private_messages, [:item_id, :created_at]
  end
end
