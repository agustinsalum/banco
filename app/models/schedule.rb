class Schedule < ApplicationRecord
  validates :day_week, :hour_since, :hour_until, presence: true
  validates :day_week, uniqueness: { scope: :subsidiary_id }
  validate :hour_black_and_until_since_menor
  belongs_to :subsidiary

  def hour_black_and_until_since_menor
    if hour_since.nil?
      puts "Entre 1"
      errors.add(:hour_since, "La hora desde no puede estar vacia")
    elsif hour_until.nil?
      puts "Entre 2"
      errors.add(:hour_until, "La hora hasta no puede estar vacia")
    else
      puts "Entre 3"
      if hour_since > hour_until
        puts "Entre 4"
        errors.add(:hour_since, "La hora anterior no puede ser mayor a la posterior")
      end
    end
  end
end