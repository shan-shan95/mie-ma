class AddIndexToEvaluationComments < ActiveRecord::Migration[5.2]
  def change
    add_index :evaluation_comments, :be_evaluated_id
  end
end
