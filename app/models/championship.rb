class Championship < ApplicationRecord

  belongs_to :category
  belongs_to :sub_category, optional: true
  belongs_to :one, class_name: 'Pilot', optional: true
  belongs_to :two, class_name: 'Pilot', optional: true
  belongs_to :three, class_name: 'Pilot', optional: true
  has_many :races

  accepts_nested_attributes_for :races, allow_destroy: true

  validates :name, presence: true
  validates :year, presence: true
end
