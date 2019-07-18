class Race < ApplicationRecord
  belongs_to :championship
  belongs_to :circuit
  has_one :category, through: :championship
  has_many :steps
  has_many :pilot_races
  has_many :race_results

  accepts_nested_attributes_for :steps, allow_destroy: true
  accepts_nested_attributes_for :pilot_races, allow_destroy: true

  validates :name, presence: true
  validates :city, presence: true
  validates :date, presence: true

  default_scope { order(date: :asc) }

  def display_name
    "#{date} - #{name}"
  end

  def posible_pilots
    category.pilots.collect { |pilot| [pilot.full_name, pilot.id] }
  end

  def registered_pilots
    pilot_races.collect { |pr| [pr, pr.id] }
  end

  def close
    return false if done

    pilot_races.each do |pilot_race|
      score = pilot_race.calculate_score
      RaceResult.create!(pilot_race_id: pilot_race.id,
                         race: self,
                         score: score,
                         score_for_champ: score)
    end
    update_positions && update(done: true)
  end

  def update_positions
    final_res = steps.order(number: :asc).last.pilot_steps.order(position: :asc)
    final_res.each do |pilot_step|
      rr = race_results.find_by(pilot_race_id: pilot_step.pilot_race.id)
      rr.update(position: pilot_step.position)
    end
  end

  def update_race_results
    return unless race_results.exists?

    pilot_races.each do |pilot_race|
      score = pilot_race.calculate_score
      rr = race_results.find_by(pilot_race_id: pilot_race.id)
      rr.update(score: score, score_for_champ: score)
    end
    update_positions
  end

end
