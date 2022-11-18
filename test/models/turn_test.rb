require "test_helper"

class TurnTest < ActiveSupport::TestCase
  def setup
    @fecha_hoy = DateTime.now()
    una_provincia = Province.new(name_province: "Buenos aires")
    una_localidad = Locality.new(name_locality: 'Necochea', province: una_provincia )
    @una_sucursal = Subsidiary.new(address: "Calle 6 esquina 83", phone: "2262000000", locality: una_localidad)
    @un_cliente = User.new(email: 'agustin@gmail.com', password: '12345678', role: 3 )
    un_empleado = User.new(email: 'juan@gmail.com', password: '12345678', role: 2 )
  end

  def test_valido
    un_turno_valido = Turn.new(date_hour: @fecha_hoy, reason_turn: "Renovacion de tarjeta", subsidiary: @una_sucursal, state: 'Pendiente', user_client: @un_cliente)
    assert un_turno_valido.valid?
  end

  # Falta el motivo (o razon) del turno que tiene validacion obligatoria
  def test_no_valido
    un_turno_no_valido = Turn.new(date_hour: @fecha_hoy, subsidiary: @una_sucursal, state: 'Pendiente', user_client: @un_cliente)
    assert_not un_turno_no_valido.valid?
  end
end
