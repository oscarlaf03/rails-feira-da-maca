class Question < ApplicationRecord
  belongs_to :asker, class_name: 'User', foreign_key: 'user_id'
  belongs_to :product
  validates :asker, :question_description, presence: true
  validates :answer_description, presence: true, allow_nil: true
end
