class EvaluationComment < ApplicationRecord
  belongs_to :be_evaluated, class_name: "User"
  belongs_to :evaluator, class_name: "User"

  after_create :update

  validates :status, presence: true
  validates :comment, length: { maximum: 255 }
  validates :item_id, presence: true

  enum status: %i[good normal bad]
  enum evaluator_type: %i[seller buyer]

  private

  def update
    eval = UserEvaluation.find_by(user_id: be_evaluated_id)
    eval.update(status.to_sym => eval[status] + 1)
  end
end
