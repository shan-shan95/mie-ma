# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.integer :status, null: false
      t.string :buyer_id, null: false
      t.string :seller_id
      t.date :start_on, null: false
      t.date :end_on
      t.integer :view, default: 0
      t.timestamps
    end
  end
end
