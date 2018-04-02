class Product < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :askers, foreign_key: 'user_id' ,through: :questions

end
