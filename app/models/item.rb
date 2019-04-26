# frozen_string_literal: true

class Item < ApplicationRecord
  include IdGenerator

  belongs_to :buyer, class_name: 'User', optional: true
  belongs_to :seller, class_name: 'User'

  before_save :set_start_on

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :buyer_id, presence: true
  validates :start_on, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  enum status: %i[brand_new excellent poor junk] # 新品 良品 傷あり ジャンク
  enum trading_status: %i[now_on_sale trading completed] # 販売中 取引中 取引完了

  private

  def set_start_on
    self.start_on = Date.today
  end
end
