class Product < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  validates :price, :status, :description, :category, :product_type, presence: true

  has_many :questions, dependent: :destroy
  has_many :askers, through: :questions
end
