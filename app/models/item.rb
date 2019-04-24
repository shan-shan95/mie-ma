# frozen_string_literal: true

class Item < ApplicationRecord
  include IdGenerator

  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User', optional: true

  before_save :set_start_on

  enum status: [
    :brand_new, # 新品
    :excellent, # 良品
    :poor, # 傷あり
    :junk # ジャンク
  ]

  private

  def set_start_on
    self.start_on = Date.today
  end
end
