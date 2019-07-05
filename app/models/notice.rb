class Notice < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 6 }
  validates :context, presence: true
  validates :context, length: { minimum: 50 }
  
end
