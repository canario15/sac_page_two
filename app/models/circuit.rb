class Circuit < ApplicationRecord

  has_one_attached :logo
  has_one_attached :truck

  validates :name, presence: true
  validates :name, length: { minimum: 6 }

end
