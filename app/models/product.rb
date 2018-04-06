class Product < ApplicationRecord
    mount_uploader :product_photo, PhotoUploader
    mount_uploader :category_photo, PhotoUploader

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  has_many :questions, dependent: :destroy
  has_many :askers, through: :questions
  validates :product_type, :category, :description, :price, :memory, :color, presence: true
end
