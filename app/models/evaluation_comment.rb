class EvaluationComment < ApplicationRecord
  belongs_to :be_evaluated, class_name: "User"
  belongs_to :evaluator, class_name: "User"
  belongs_to :item

  after_create :update_user_eval_status
  after_create :update_item_status

  validates :status, presence: true
  validates :comment, length: { maximum: 255 }

  enum status: %i[good normal bad]
  enum evaluator_type: %i[seller buyer]

  def evaluator_name
    attributes.merge(evaluator_name: evaluator.nickname)
  end

  private

  def update_user_eval_status
    eval = UserEvaluation.find_by(user_id: be_evaluated_id)
    eval.update(status.to_sym => eval[status] + 1)
  end

  def update_item_status
    if item.completed_evaluation?
      item.update(trading_status: :completed, eval_status: :completed_both)
    elsif evaluator_type == "seller"
      item.update(eval_status: :wait_buyer)
    elsif evaluator_type == "buyer"
      item.update(eval_status: :wait_seller)
    end
  end
end
