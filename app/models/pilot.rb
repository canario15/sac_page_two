class Pilot < ApplicationRecord

  has_one_attached :avatar
  has_one_attached :car_pic
  has_one_attached :helmet_pic
  has_one_attached :complete_pic

  has_and_belongs_to_many :categories

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :car, presence: true

  after_validation :set_full_name, on: %i[create update]

  private

  def set_full_name
    self.full_name = first_name + ' ' + last_name
  end
end
