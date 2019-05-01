class EvaluationComment < ApplicationRecord
  belongs_to :user

  validates :comment, length: {maximum: 255}

  enum status: %i[:good :normal :bad]
end
