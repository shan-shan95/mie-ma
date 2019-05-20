class EvaluationComment < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  after_create :update_user_eval

  validates :status, presence: true
  validates :comment, length: {maximum: 255}

  enum status: %i[good normal bad]

  private

  def update_user_eval
    UserEvaluation.find_by(user_id: seller_id).update(status.to_sym => eval[status] + 1)
  end
end
