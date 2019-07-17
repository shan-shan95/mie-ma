class User < ApplicationRecord
  include IdGenerator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable

  has_one :evaluation, class_name: "UserEvaluation", dependent: :destroy
  has_many :buy_items, foreign_key: "buyer_id", class_name: "Item", dependent: :destroy
  has_many :sell_items, foreign_key: "seller_id", class_name: "Item", dependent: :destroy
  has_many :public_messages, foreign_key: "sender_id", dependent: :destroy
  has_many :private_messages, foreign_key: "sender_id", dependent: :destroy
  has_many :evaluation_comments, foreign_key: "be_evaluated_id", dependent: :destroy

  after_create :create_user_eval

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@(m.mie-u.ac.jp|galaxy.ocn.ne.jp)\z/

  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :encrypted_password, presence: true

  def is_trading?(item)
    item.trading? && self.is_trader?(item)
  end

  def is_trader?(item)
    self == item.seller || self == item.buyer
  end

  def is_seller?(item)
    self == item.seller
  end

  def is_buyer?(item)
    self == item.buyer
  end

  def seller_or_buyer(item)
    if is_seller?(item)
      "seller"
    elsif is_buyer?(item)
      "buyer"
    end
  end

  def is_completed_evaluation?(item)
    return item.evaluation_comments&.select { |x| x.evaluator_id == id }.present?
  end

  private

  def create_user_eval
    UserEvaluation.create(user_id: id)
  end
end
