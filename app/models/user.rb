class User < ApplicationRecord
    mount_uploader :user_photo, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products, foreign_key: 'owner_id'
  has_many :questions
  validates :first_name, :last_name, presence: true, allow_nil: true

  end
