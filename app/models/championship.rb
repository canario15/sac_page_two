class Championship < ApplicationRecord

  belongs_to :category
  belongs_to :one, class_name: 'Pilot', optional: true
  belongs_to :two, class_name: 'Pilot', optional: true
  belongs_to :three, class_name: 'Pilot', optional: true

  validates :name, presence: true
  validates :year, presence: true

end
