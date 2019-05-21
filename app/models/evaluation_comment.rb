class EvaluationComment < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  after_create :update

  validates :status, presence: true
  validates :comment, length: {maximum: 255}

  enum status: %i[good normal bad]

  def merged_attr
    attributes.merge(buyer_name: User.find(buyer_id).nickname)
  end

  private

  def update
    eval = UserEvaluation.find_by(user_id: seller_id)
    eval.update(status.to_sym => eval[status] + 1)
  end
end
