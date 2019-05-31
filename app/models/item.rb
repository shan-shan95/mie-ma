class Item < ApplicationRecord
  include IdGenerator

  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User"
  has_many :evaluation_comments, dependent: :destroy
  has_many :public_messages, dependent: :destroy
  has_many :private_messages, dependent: :destroy
  has_many_attached :images

  before_save :set_start_on

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :seller_id, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :images, length: { maximum: 4 }
  validate :validate_images

  enum status: %i[brand_new excellent poor junk] # 新品 良品 傷あり ジャンク
  enum trading_status: %i[now_on_sale trading completed] # 販売中 取引中 取引完了
  enum eval_status: %i[wait_both wait_seller wait_buyer completed_both] # 両者待ち 販売者待ち 購入者待ち 完了

  def with_sumbnail_url
    if images.present?
      attributes.merge(
        sumbnail_url: images.first.variant(
          combine_options: {
            resize: "128x128^",
            crop: "128x128+0+0",
            gravity: :center,
          },
        ).processed.service_url,
      )
    else
      self
    end
  end

  def with_images_url
    if images.present?
      images_url = images.map { |image|
        image.variant(
          resize: "400x300^",
        ).processed.service_url
      }
      attributes.merge(images_url: images_url)
    else
      self
    end
  end

  def be_evaluated_id(user_id)
    return buyer_id if user_id == seller_id
    return seller_id if user_id == buyer_id
  end

  def completed_evaluation?
    return evaluation_comments&.length == 2
  end

  private

  def set_start_on
    self.start_on = Date.today
  end

  def validate_images
    return unless images.attached?
    images.each_with_index { |image, i|
      if image.blob.byte_size > 10.megabytes
        images.purge
        errors.add(:images, "#{i + 1}番目のファイルのサイズが大きすぎます。10MB以下にしてください。")
      elsif !image?(image)
        image.purge
        errors.add(:images, "#{i + 1}番目のファイルの拡張子に対応していません。jpg, jpeg, png, gifをアップロードしてください。")
      end
    }
  end

  def image?(file)
    %w(image/jpg image/jpeg image/gif image/png).include?(file.blob.content_type)
  end
end
