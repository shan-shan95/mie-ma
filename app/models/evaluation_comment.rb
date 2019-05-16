class EvaluationComment < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  before_create :create_user_eval

  validates :status, presence: true
  validates :comment, length: {maximum: 255}

  enum status: %i[good normal bad]

  private

  def create_user_eval
    eval = User.find(seller_id).evaluation
    eval = UserEvaluation.create(user_id: seller_id) if eval.nil?
    eval.update(status.to_sym => eval[status] + 1)
  end
end
