class PilotRace < ApplicationRecord
  belongs_to :pilot
  belongs_to :race

  validates :number, presence: true

end
