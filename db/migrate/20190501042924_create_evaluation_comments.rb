class CreateEvaluationComments < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_comments do |t|
      t.references :be_evaluated, null: false, foreign_key: { to_table: :users }, type: :string
      t.references :evaluator, null: false, foreign_key: { to_table: :users }, index: false, type: :string
      t.references :item, null: false, type: :string
      t.integer :evaluator_type, null: false
      t.integer :status, null: false
      t.text :comment, limit: 255
      t.timestamps
    end
    add_index :evaluation_comments, [:be_evaluated_id, :created_at]
  end
end
