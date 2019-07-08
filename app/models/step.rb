class Step < ApplicationRecord
  belongs_to :race

  validates :name, presence: true
  validates :number, presence: true

end
