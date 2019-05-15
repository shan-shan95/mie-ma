class CreateUserEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_evaluations do |t|
      t.references :user, foreign_key: true, null: false, unique: true, type: :string
      t.integer :good, null: false, default: 0
      t.integer :normal, null: false, default: 0
      t.integer :bad, null: false, default: 0
    end
  end
end
