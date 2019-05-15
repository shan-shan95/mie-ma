class EvaluationComment < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  validates :status, presence: true
  validates :comment, length: {maximum: 255}

  enum status: %i[good normal bad]
end
