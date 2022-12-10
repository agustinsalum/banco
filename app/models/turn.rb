class Turn < ApplicationRecord
  self.per_page = 4 # Cantidad de turnos por pagina
  validates :reason_turn, :turn_date, :hour, :state, presence: true
  validates :comment, presence: false
  validates :turn_date, uniqueness: { scope: [ :hour, :user_client_id ] }
  validate  :allowed_hour
  validate  :later_date
  belongs_to :subsidiary
  belongs_to :user_client, class_name: :User
  belongs_to :user_bank, class_name: :User, optional: true
  
  def allowed_hour
    horario_semana = nil
    encontre = false
    dia_semana = turn_date.strftime("%A")
    horarios_sucursal = subsidiary.schedules
    horarios_sucursal.find_each do |horario|
      if (horario.day_week == dia_semana) || (encontre)
        horario_semana = horario
        encontre = true
      end
    end
    if (encontre)
      if !(horario_semana.hour_since.strftime('%H%M').to_i >= hour.strftime('%H%M').to_i) and (horario_semana.hour_until.strftime('%H%M').to_i <= hour.strftime('%H%M').to_i )
        errors.add(:hour, "La sucursal #{subsidiary} no atiende entre esas horas")
      end
    else
        errors.add(:hour, "La sucursal #{subsidiary.name_subsidiary} no atiende los #{dia_semana}")
    end
  end

  def later_date
    fecha_actual = Time.now()
    if turn_date < fecha_actual
      errors.add(:turn_date, "La fecha debe ser actual")
    end
  end 
end
