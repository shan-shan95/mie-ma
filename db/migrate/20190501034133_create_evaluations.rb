class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :user, null: false, foreign_key: true, type: :string, unique: true
      t.integer :good, null: false, default: 0
      t.integer :normal, null: false, default: 0
      t.integer :bad, null: false, default: 0
      t.timestamps
    end
  end
end
