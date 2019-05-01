# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.integer :trading_status, null: false, default: 0
      t.references :buyer, foreign_key: {to_table: :users}, type: :string
      t.references :seller, null: false, foreign_key: {to_table: :users}, type: :string
      t.date :start_on, null: false
      t.date :end_on
      t.integer :view, default: 0
      t.timestamps
    end
    add_index :items, :id, unique: true
    add_index :items, :created_at
  end
end
