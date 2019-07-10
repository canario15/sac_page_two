class Pilot < ApplicationRecord

  has_one_attached :avatar
  has_one_attached :car_pic
  has_one_attached :helmet_pic
  has_one_attached :complete_pic

  has_and_belongs_to_many :categories

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :city, presence: true
  validates :car, presence: true

  def full_name
    first_name + ' ' + last_name
  end

  def to_s
    full_name
  end
end
