class Question < ApplicationRecord
  belongs_to :asker, class_name: 'User', foreign_key: 'user_id'
  belongs_to :product
  validates :asker, presence: true
end
