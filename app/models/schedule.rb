class Schedule < ApplicationRecord
  validates :day_week, presence: true
  validates :hour, presence: true
  belongs_to :subsidiary
end
