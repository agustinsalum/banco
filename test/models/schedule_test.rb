require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  def setup
    una_provincia = Province.new(name_province: "Buenos aires")
    una_localidad = Locality.new(name_locality: 'Necochea', province: una_provincia )
    @una_sucursal = Subsidiary.new(address: 'Calle 6 esquina 83 n 000',phone: '2262-000000', locality: una_localidad)
    @fecha_actual = Time.now()
    @fecha_actual_mayor = Time.now()+10
  end
  
  def test_valido
    un_horario_valido = Schedule.new(day_week: "Lunes", hour_since: @fecha_actual.strftime("%I:%M:%S"), hour_until: @fecha_actual_mayor.strftime("%I:%M:%S"), schedule_date: @fecha_actual, subsidiary: @una_sucursal)
    assert un_horario_valido.valid?
  end
  
  # Falta el dia de la semana que tiene validacion obligatoria
  def test_no_valido_dia
    un_horario_no_valido = un_horario_valido = Schedule.new(hour_since: @fecha_actual.strftime("%I:%M:%S"), hour_until: @fecha_actual_mayor.strftime("%I:%M:%S"), schedule_date: @fecha_actual, subsidiary: @una_sucursal)
    assert_not un_horario_no_valido.valid?
  end
  
  # La hora desde no puede ser mayor a la de hasta
  def test_no_valido_horas
    un_horario_no_valido = Schedule.new(day_week: "Lunes", hour_since: @fecha_actual_mayor.strftime("%I:%M:%S"), hour_until: @fecha_actual.strftime("%I:%M:%S"), schedule_date: @fecha_actual, subsidiary: @una_sucursal)
    assert_not un_horario_no_valido.valid?
  end
end
