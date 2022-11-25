require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  def setup
    una_provincia = Province.new(name_province: "Buenos aires")
    una_localidad = Locality.new(name_locality: 'Necochea', province: una_provincia )
    @una_sucursal = Subsidiary.new(address: 'Calle 6 esquina 83 n 000',phone: '2262-000000', locality: una_localidad)
  end
  
  def test_valido
    un_horario_valido = Schedule.new(day_week: "Lunes", hour_since: '08:00', hour_until: '15:00', subsidiary: @una_sucursal)
    assert un_horario_valido.valid?
  end
  
  # Falta el dia de la semana que tiene validacion obligatoria
  def test_no_valido_dia
    un_horario_no_valido = un_horario_valido = Schedule.new(hour_since: '08:00', hour_until: '15:00', subsidiary: @una_sucursal)
    assert_not un_horario_no_valido.valid?
  end
  
  # La hora desde no puede ser mayor a la de hasta
  def test_no_valido_horas
    un_horario_no_valido = Schedule.new(day_week: "Lunes", hour_since: '12:00', hour_until: '09:00', subsidiary: @una_sucursal)
    assert_not un_horario_no_valido.valid?
  end
end
