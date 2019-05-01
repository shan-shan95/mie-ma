class CreateEvaluationComments < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_comments do |t|
      t.references :evaluation, foreign_key: true, null: false
      t.integer :status, null: false
      t.text :comment, limit: 255
      t.timestamps
    end
  end
end
