class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :item

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :item_id, presence: true
  validates :content, length: {maximum: 255}, presence: true
end
