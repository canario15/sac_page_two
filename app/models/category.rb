class Category < ApplicationRecord

  has_one_attached :image

  has_and_belongs_to_many :pilots

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :description, presence: true
  validates :description, length: { minimum: 50 }
  validate :image_format

end
