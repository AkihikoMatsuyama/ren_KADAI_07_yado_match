class Room < ApplicationRecord
  has_many :reservations
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :profile, presence: true
  validates :money, presence: true,numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :address, presence: true
  validates :image, presence: true

end
