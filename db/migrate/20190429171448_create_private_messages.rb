class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }, index: false, type: :string
      t.references :recepient, null: false, foreign_key: { to_table: :users }, index: false, type: :string
      t.references :item, null: false, foreign_key: true, type: :string
      t.text :content, null: false, limit: 255
      t.timestamps
    end
    add_index :private_messages, [:item_id, :created_at]
  end
end
