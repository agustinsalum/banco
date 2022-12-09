class Turn < ApplicationRecord
  self.per_page = 4 # Cantidad de turnos por pagina
  validates :reason_turn, :turn_date, :hour, :state, presence: true
  validates :comment, presence: false
  validates :turn_date, uniqueness: { scope: :user_client_id }
  validate  :allowed_hour
  validate  :later_date
  belongs_to :subsidiary
  belongs_to :user_client, class_name: :User
  belongs_to :user_bank, class_name: :User, optional: true
  
  def allowed_hour
    schedule_week = nil
    week = turn_date.strftime("%A")
    schedules_subsidiary = subsidiary.schedules
    schedules_subsidiary.find_each do |schedule|
      if (schedule.day_week == week)
        schedule_week = schedule 
      end
    end
    if (schedule_week != nil)
      if !(schedule_week.hour_since >= hour and schedule_week.hour_until <= hour )
        errors.add(:hour, "La sucursal #{subsidiary} no atiende entre esas horas")
      end
    else
        errors.add(:hour, "La sucursal #{subsidiary.name_subsidiary} no atiende los #{week}")
    end
  end

  def later_date
    fecha_actual = Time.now()
    if turn_date < fecha_actual
      errors.add(:turn_date, "La fecha debe ser actual")
    end
  end 
end
