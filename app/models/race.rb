class Race < ApplicationRecord
  belongs_to :championship
  belongs_to :circuit

  validates :name, presence: true
  validates :city, presence: true
  validates :date, presence: true

  def display_name
    "#{date} - #{name}"
  end

end
