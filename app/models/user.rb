class User < ApplicationRecord
  # has_many :Rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_secure_password
  mount_uploader :image, ImageUploader
  
  validates :email, presence: true, confirmation: true

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  
  def email_required?
    false
  end
end
