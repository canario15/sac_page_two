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

  def display_name
    "#{date} - #{name}"
  end

  def posible_pilots
    category.pilots.collect { |pilot| [pilot.full_name, pilot.id] }
  end

  def registered_pilots
    pilot_races.collect { |pr| [pr , pr.id] }
  end
end
