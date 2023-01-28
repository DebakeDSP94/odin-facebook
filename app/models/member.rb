class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  mount_uploader :profile, ProfileUploader
  has_many :likes
  has_many :friends, class_name: "Member"
  has_many :comments
  has_and_belongs_to_many :friend_requests
end
