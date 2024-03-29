class Schedule < ApplicationRecord
  self.per_page = 4 # Cantidad de turnos por pagina
  validates :day_week, :hour_since, :hour_until, presence: true
  validates :day_week, uniqueness: { scope: :subsidiary_id }
  validate :hour_black_and_until_since_menor
  belongs_to :subsidiary
  
  @@days = [ 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday' ]

  def self.days_week
    @@days
  end

  def hour_black_and_until_since_menor
    if hour_since.nil?
      errors.add(:hour_since, "La hora desde no puede estar vacia")
    elsif hour_until.nil?
      errors.add(:hour_until, "La hora hasta no puede estar vacia")
    else
      hour_since_str = hour_since.strftime("%H:%M")
      hour_until_str = hour_until.strftime("%H:%M")
      if hour_since_str > hour_until_str
        errors.add(:hour_since, "La hora anterior no puede ser mayor a la posterior")
      end
    end
  end
end