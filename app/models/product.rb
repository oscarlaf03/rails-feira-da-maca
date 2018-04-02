class Product < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :users, through: :questions

end
