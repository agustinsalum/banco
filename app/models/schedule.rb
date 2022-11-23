class Schedule < ApplicationRecord
  validates :day_week, :hour_since, :hour_until, presence: true
  validate :until_since_menor
  belongs_to :subsidiary

  def until_since_menor
    if (hour_since > hour_until)
      errors.add(:hour_since, "La hora anterior no puede ser mayor a la posterior")
    end
  end
end