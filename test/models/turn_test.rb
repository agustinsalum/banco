require "test_helper"

class TurnTest < ActiveSupport::TestCase
  def setup
    @fecha_actual = DateTime.now()
    @fecha_2022_diciembre_18 = DateTime.civil_from_format :local, 2022, 12, 18

    #
    una_provincia = Province.new(name_province: "Buenos aires test")
    una_provincia.save
    una_localidad = Locality.new(name_locality: 'Necochea test', province: una_provincia )
    una_localidad.save
    @una_sucursal = Subsidiary.new(name_subsidiary: 'Villa diaz velez test', address: "Calle 6 esquina 83 test", phone: "2262000000", locality: una_localidad)
    @una_sucursal.save
    @otra_sucursal = Subsidiary.new(name_subsidiary: 'otra sucursal test', address: "Calle 2 esquina 43 test", phone: "2262343222", locality: una_localidad)
    @otra_sucursal.save
    @usuario_cliente = User.new( email: 'cliente@test.com', password: '123456789', password_confirmation: '123456789', name: 'cliente')
    @usuario_cliente.save
    @usuario_empleado = User.new( email: 'empleado@test.com', password: '123456789', password_confirmation: '123456789', name: 'cliente', role: 2)
    @usuario_empleado.save
  end

  def test_valido_completo
    un_turno_valido = Turn.new(turn_date: @fecha_2022_diciembre_18, hour: @fecha_2022_diciembre_18, reason_turn: "Renovacion de tarjeta test", subsidiary: @una_sucursal, state: 'Pendiente', user_client: @usuario_cliente)
    assert un_turno_valido.valid?
  end
  
  def test_valido_fk
    un_turno_1 = Turn.new(turn_date: @fecha_actual, hour: @fecha_2022_diciembre_18, reason_turn: "Renovacion de tarjeta test", subsidiary: @una_sucursal, state: 'Pendiente', user_client: @usuario_cliente)
    un_turno_1.save
    un_turno_2 = Turn.new(turn_date: @fecha_2022_diciembre_18, hour: @fecha_2022_diciembre_18, reason_turn: "Cambio de contraseña test", subsidiary: @una_sucursal, state: 'Pendiente', user_client: @usuario_cliente)
    assert un_turno_2.valid?
  end

  def test_no_valido_fk
    un_turno_1 = Turn.new(turn_date: @fecha_2022_diciembre_18, hour: @fecha_actual, reason_turn: "Renovacion de tarjeta test", subsidiary: @una_sucursal, state: 'Pendiente', user_client: @usuario_cliente)
    un_turno_1.save
    un_turno_2 = Turn.new(turn_date: @fecha_2022_diciembre_18, hour: @fecha_2022_diciembre_18, reason_turn: "Cambio de contraseña test", subsidiary: @una_sucursal, state: 'Pendiente', user_client: @usuario_cliente)
    assert_not un_turno_2.valid?
  end

  # Falta el motivo (o razon) del turno que tiene validacion obligatoria
  def test_no_valido
    un_turno_no_valido = Turn.new(turn_date: @fecha_2022_diciembre_18, hour: @fecha_2022_diciembre_18, subsidiary: @una_sucursal, state: 'Pendiente', user_client: @usuario_cliente)
    assert_not un_turno_no_valido.valid?
  end
end
