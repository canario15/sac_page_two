class Race < ApplicationRecord
  belongs_to :championship
  belongs_to :circuit
  has_many :steps

  accepts_nested_attributes_for :steps, allow_destroy: true

  validates :name, presence: true
  validates :city, presence: true
  validates :date, presence: true

  def display_name
    "#{date} - #{name}"
  end

end
