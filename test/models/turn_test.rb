require "test_helper"

class TurnTest < ActiveSupport::TestCase
  def setup
    # Fechas
    @fecha_2022_diciembre_18 = DateTime.civil_from_format :local, 2022, 12, 18
    @fecha_2022_diciembre_19 = DateTime.civil_from_format :local, 2022, 12, 19
    @fecha_2022_diciembre_20 = DateTime.civil_from_format :local, 2022, 12, 20
    @fecha_2022_diciembre_21 = DateTime.civil_from_format :local, 2022, 12, 21
    @fecha_2022_diciembre_22 = DateTime.civil_from_format :local, 2022, 12, 22
    @fecha_2022_diciembre_23 = DateTime.civil_from_format :local, 2022, 12, 23
    @fecha_2022_diciembre_26 = DateTime.civil_from_format :local, 2022, 12, 26
    @fecha_2022_diciembre_27 = DateTime.civil_from_format :local, 2022, 12, 27
    @fecha_2022_diciembre_28 = DateTime.civil_from_format :local, 2022, 12, 28
    
    # Horas
    @tiempo_ocho_mañana        = Time.new(2022, 12, 1,  8,  0,  0)
    @tiempo_nueve_mañana       = Time.new(2022, 12, 1,  9,  0,  0)
    @tiempo_diez_mañana        = Time.new(2022, 12, 1,  10,  0,  0)
    @tiempo_once_mañana        = Time.new(2022, 12, 1,  11,  0,  0)
    @tiempo_doce_mañana        = Time.new(2022, 12, 1,  12,  0,  0)
    @tiempo_trece_tarde        = Time.new(2022, 12, 1,  13,  0,  0)
    @tiempo_catorce_tarde      = Time.new(2022, 12, 1,  14,  0,  0)
    @tiempo_quince_tarde       = Time.new(2022, 12, 1,  15,  0,  0)
    @tiempo_dieciseis_tarde    = Time.new(2022, 12, 1,  16,  0,  0)
    @tiempo_diecisiete_tarde   = Time.new(2022, 12, 1,  17,  0,  0)
    @tiempo_dieciocho_tarde    = Time.new(2022, 12, 1,  18,  0,  0)

    #
    una_provincia = Province.new(name_province: "Buenos aires test")
    una_provincia.save
    una_localidad = Locality.new(name_locality: 'Necochea test', province: una_provincia )
    una_localidad.save
    @sucursal_83 = Subsidiary.new(name_subsidiary: 'Villa diaz velez test', address: "Calle 6 esquina 83 test", phone: "2262000000", locality: una_localidad)
    @sucursal_83.save
    @otra_sucursal = Subsidiary.new(name_subsidiary: 'otra sucursal test', address: "Calle 2 esquina 43 test", phone: "2262343222", locality: una_localidad)
    @otra_sucursal.save
    @usuario_cliente = User.new( email: 'cliente@test.com', password: '123456789', password_confirmation: '123456789', name: 'cliente')
    @usuario_cliente.save
    @usuario_empleado = User.new( email: 'empleado@test.com', password: '123456789', password_confirmation: '123456789', name: 'cliente', role: 2)
    @usuario_empleado.save

    # Horarios
    horario_lunes_sucursal_83     = Schedule.new(day_week: "Monday"      , hour_since: @tiempo_ocho_mañana   , hour_until: @tiempo_dieciseis_tarde      ,  subsidiary: @sucursal_83)
    horario_lunes_sucursal_83.save()
    horario_martes_sucursal_83    = Schedule.new(day_week: "Tuesday"     , hour_since: @tiempo_ocho_mañana   , hour_until: @tiempo_dieciseis_tarde      ,  subsidiary: @sucursal_83)
    horario_martes_sucursal_83.save()
    horario_miercoles_sucursal_83 = Schedule.new(day_week: "Wednesday"   , hour_since: @tiempo_ocho_mañana   , hour_until: @tiempo_dieciseis_tarde      ,  subsidiary: @sucursal_83)
    horario_miercoles_sucursal_83.save()
    horario_jueves_sucursal_83    = Schedule.new(day_week: "Thursday"    , hour_since: @tiempo_ocho_mañana   , hour_until: @tiempo_dieciseis_tarde      ,  subsidiary: @sucursal_83)
    horario_jueves_sucursal_83.save()
    horario_viernes_sucursal_83   = Schedule.new(day_week: "Friday"      , hour_since: @tiempo_ocho_mañana   , hour_until: @tiempo_dieciseis_tarde      ,  subsidiary: @sucursal_83)
    horario_viernes_sucursal_83.save()
  
  end

  def test_valido_completo
    un_turno_valido = Turn.new(turn_date: @fecha_2022_diciembre_19, hour: @tiempo_doce_mañana, reason_turn: "Renovacion de tarjeta test", subsidiary: @sucursal_83, state: 'Pendiente', user_client: @usuario_cliente)
    assert un_turno_valido.valid?
  end

  def test_valido_fk
    un_turno_1 = Turn.new(turn_date: @fecha_2022_diciembre_19, hour: @tiempo_doce_mañana, reason_turn: "Renovacion de tarjeta test", subsidiary: @sucursal_83, state: 'Pendiente', user_client: @usuario_cliente)
    p un_turno_1.valid?
    un_turno_1.save
    un_turno_2 = Turn.new(turn_date: @fecha_2022_diciembre_19, hour: @tiempo_trece_tarde, reason_turn: "Cambio de contraseña test", subsidiary: @sucursal_83, state: 'Pendiente', user_client: @usuario_cliente)
    assert un_turno_2.valid?
  end
 
  def test_no_valido_fk
    un_turno_1 = Turn.new(turn_date: @fecha_2022_diciembre_19, hour: @tiempo_doce_mañana, reason_turn: "Renovacion de tarjeta test", subsidiary: @sucursal_83, state: 'Pendiente', user_client: @usuario_cliente)
    un_turno_1.save
    un_turno_2 = Turn.new(turn_date: @fecha_2022_diciembre_19, hour: @tiempo_doce_mañana, reason_turn: "Cambio de contraseña test", subsidiary: @sucursal_83, state: 'Pendiente', user_client: @usuario_cliente)
    assert_not un_turno_2.valid?
  end

  # Falta el motivo (o razon) del turno que tiene validacion obligatoria
  def test_no_valido
    un_turno_no_valido = Turn.new(turn_date: @fecha_2022_diciembre_19, hour: @tiempo_doce_mañana, subsidiary: @sucursal_83, state: 'Pendiente', user_client: @usuario_cliente)
    assert_not un_turno_no_valido.valid?
  end
end
