class PilotStep < ApplicationRecord
  belongs_to :step
  belongs_to :pilot_race

  validates :score, presence: true
  validates :position, presence: true
  validates :time, presence: true

end
