class RaceResult < ApplicationRecord
  belongs_to :pilot_race
  belongs_to :race
  belongs_to :pilot

  validates :score, presence: true
  validates :position, presence: true
  validates :score_for_champ, presence: true

end
