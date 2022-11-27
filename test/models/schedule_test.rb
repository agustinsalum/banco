require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  def setup
    una_provincia = Province.new(name_province: "Buenos aires test")
    una_provincia.save
    una_localidad = Locality.new(name_locality: 'Necochea test', province: una_provincia )
    una_localidad.save
    @una_sucursal = Subsidiary.new(name_subsidiary: 'Villa Diaz Velez test',address: 'Calle 6 esquina 83 n 000 test',phone: '2262-000000', locality: una_localidad)
    @una_sucursal.save
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
  
  # Falta la hora desde y hasta
  def test_no_valido_hora_desde_hasta
    un_horario_no_valido = Schedule.new(day_week: "Lunes", subsidiary: @una_sucursal)
    assert_not un_horario_no_valido.valid?
  end
  
  # Repetido el dia y la sucursal
  def test_no_valido_repetido
    un_horario_valido = Schedule.new(day_week: "Lunes", hour_since: '08:00', hour_until: '15:00', subsidiary: @una_sucursal)
    un_horario_valido.save
    un_horario_repetido = Schedule.new(day_week: "Lunes", hour_since: '11:00', hour_until: '17:00', subsidiary: @una_sucursal)
    assert_not un_horario_repetido.valid?
  end
  
  # La hora desde no puede ser mayor a la de hasta
  def test_no_valido_horas
    un_horario_no_valido = Schedule.new(day_week: "Lunes", hour_since: '12:00', hour_until: '09:00', subsidiary: @una_sucursal)
    assert_not un_horario_no_valido.valid?
  end

end
