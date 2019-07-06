class Notice < ApplicationRecord

  has_one_attached :image

  validates :title, presence: true
  validates :title, length: { minimum: 6 }
  validates :context, presence: true
  validates :context, length: { minimum: 50 }
  validate :image_format

end
