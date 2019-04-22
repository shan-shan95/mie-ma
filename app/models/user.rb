# frozen_string_literal: true

class User < ApplicationRecord
  include IdGenerator

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :buy_items, foreign_key: 'buyer_id', class_name: 'Item'
  has_many :sell_items, foreign_key: 'seller_id', class_name: 'Item'

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
end
