class Step < ApplicationRecord
  belongs_to :race
  has_many :pilot_steps

  accepts_nested_attributes_for :pilot_steps, allow_destroy: true

  validates :name, presence: true
  validates :number, presence: true

  default_scope { order(number: :asc) }

  after_update :update_race_results

  def update_race_results
    race.update_race_results
  end
end
