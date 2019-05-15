class CreateEvaluationComments < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_comments do |t|
      t.references :seller, null: false, foreign_key: {to_table: :users}, type: :string
      t.references :buyer, null: false, foreign_key: {to_table: :users}, index: false, type: :string
      t.integer :status, null: false
      t.text :comment, limit: 255
      t.timestamps
    end
    add_index :evaluation_comments, [:seller_id, :created_at]
  end
end
