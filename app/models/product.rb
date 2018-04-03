class Product < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  has_many :questions
  has_many :askers, through: :questions
end
