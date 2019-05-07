class EvaluationComment < ApplicationRecord
  belongs_to :user

  validates :status, presence: true
  validates :comment, length: {maximum: 255}, presence: true

  enum status: %i[good normal bad]
end
