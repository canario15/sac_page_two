class PilotRace < ApplicationRecord
  belongs_to :pilot
  belongs_to :race
  has_many :pilot_steps

  validates :number, presence: true

end
