class PilotRace < ApplicationRecord
  belongs_to :pilot
  belongs_to :race
  has_many :pilot_steps

  validates :number, presence: true

  default_scope { order(number: :asc) }

  def to_s
    "#{number} - #{pilot}"
  end

  def calculate_score
    score = 0
    pilot_steps.each do |pilot_step|
      score += pilot_step.score
    end
    score
  end
end
