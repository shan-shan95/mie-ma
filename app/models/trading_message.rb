# frozen_string_literal: true

class TradingMessage < ApplicationRecord
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :item

  validates :item_id, presence: true
  validates :content, length: {maximum: 255}
  validates :open_range, presence: true

  enum open_range: %i[publish unpublish]
end
