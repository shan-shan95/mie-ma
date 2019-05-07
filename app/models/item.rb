class Item < ApplicationRecord
  include IdGenerator

  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User"
  has_many :public_messages, dependent: :destroy
  has_many :private_messages, dependent: :destroy

  before_save :set_start_on

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :seller_id, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  enum status: %i[brand_new excellent poor junk] # 新品 良品 傷あり ジャンク
  enum trading_status: %i[now_on_sale trading completed] # 販売中 取引中 出品者の評価のみ完了 購入者の評価のみ完了 取引完了

  private

  def set_start_on
    self.start_on = Date.today
  end
end
