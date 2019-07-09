class Step < ApplicationRecord
  belongs_to :race
  has_many :pilot_steps

  accepts_nested_attributes_for :pilot_steps, allow_destroy: true

  validates :name, presence: true
  validates :number, presence: true

end
