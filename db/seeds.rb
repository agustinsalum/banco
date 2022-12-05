
puts "Empezamos a cargar los datos"

# Fechas
fecha_2022_diciembre_18 = DateTime.civil_from_format :local, 2022, 12, 18
fecha_2022_diciembre_19 = DateTime.civil_from_format :local, 2022, 12, 19
fecha_2022_diciembre_20 = DateTime.civil_from_format :local, 2022, 12, 20
fecha_2022_diciembre_21 = DateTime.civil_from_format :local, 2022, 12, 21
fecha_2022_diciembre_22 = DateTime.civil_from_format :local, 2022, 12, 22
fecha_2022_diciembre_23 = DateTime.civil_from_format :local, 2022, 12, 23
fecha_2022_diciembre_26 = DateTime.civil_from_format :local, 2022, 12, 26
fecha_2022_diciembre_27 = DateTime.civil_from_format :local, 2022, 12, 27
fecha_2022_diciembre_28 = DateTime.civil_from_format :local, 2022, 12, 28
fecha_2022_octubre_2    = DateTime.civil_from_format :local, 2022, 10, 2
#
tiempo_ocho_mañana        = Time.new(2022, 12, 1,  8,  0,  0)
tiempo_nueve_mañana       = Time.new(2022, 12, 1,  9,  0,  0)
tiempo_diez_mañana        = Time.new(2022, 12, 1,  10,  0,  0)
tiempo_once_mañana        = Time.new(2022, 12, 1,  11,  0,  0)
tiempo_doce_mañana        = Time.new(2022, 12, 1,  12,  0,  0)
tiempo_trece_tarde        = Time.new(2022, 12, 1,  13,  0,  0)
tiempo_catorce_tarde      = Time.new(2022, 12, 1,  14,  0,  0)
tiempo_quince_tarde       = Time.new(2022, 12, 1,  15,  0,  0)
tiempo_dieciseis_tarde    = Time.new(2022, 12, 1,  16,  0,  0)
tiempo_diecisiete_tarde   = Time.new(2022, 12, 1,  17,  0,  0)
tiempo_dieciocho_tarde    = Time.new(2022, 12, 1,  18,  0,  0)

puts "Se cargaron las fechas correctamente"
# Creamos provincias

provincia_buenos_aires = Province.new(name_province: 'Buenos aires')
provincia_santa_cruz   = Province.new(name_province: 'Santa cruz')
provincia_cordoba      = Province.new(name_province: 'Cordoba')

provincia_buenos_aires.save()
provincia_santa_cruz.save()
provincia_cordoba.save()

puts "Se cargaron las pronvincias con exito"
# Creamos localidades

localidad_necochea         = Locality.new(name_locality: 'Necochea'      , province: provincia_buenos_aires)
localidad_la_plata         = Locality.new(name_locality: 'La Plata'      , province: provincia_buenos_aires)
localidad_mar_del_plata    = Locality.new(name_locality: 'Mar del plata' , province: provincia_buenos_aires)
localidad_perito_moreno    = Locality.new(name_locality: 'Perito moreno' , province: provincia_santa_cruz)
localidad_calamuchita      = Locality.new(name_locality: 'Calamuchita'   , province: provincia_cordoba)

localidad_necochea.save()
localidad_la_plata.save()
localidad_mar_del_plata.save()
localidad_perito_moreno.save()

puts "Se cargaron las localidades con exito"
# Creamos sucursales

sucursal_83   = Subsidiary.new(name_subsidiary: 'Villa Diaz Velez'    , address: 'Calle 83'    , phone: '2262000000', locality: localidad_necochea)
sucursal_79   = Subsidiary.new(name_subsidiary: 'Diagonal 79 - playa' , address: 'Avenida 79'  , phone: '2262000001', locality: localidad_necochea)
sucursal_116  = Subsidiary.new(name_subsidiary: 'Banco perito moreno' , address: 'Esquina 116' , phone: '2262000002', locality: localidad_perito_moreno)
sucursal_111  = Subsidiary.new(name_subsidiary: 'Calamuchita bank'    , address: 'Esquina 111' , phone: '2262000003', locality: localidad_calamuchita)
sucursal_200  = Subsidiary.new(name_subsidiary: 'Mardel tribunales'   , address: 'Almte Brown' , phone: '2262000004', locality: localidad_mar_del_plata)

sucursal_83.save()
sucursal_79.save()
sucursal_116.save()
sucursal_111.save()
sucursal_200.save()

puts "Se cargaron las sucursales con exito"
# Creamos horarios para sucursales

horario_lunes_sucursal_83     = Schedule.new(day_week: "Lunes"     , hour_since: tiempo_ocho_mañana   , hour_until: tiempo_doce_mañana     ,  subsidiary: sucursal_83)
horario_martes_sucursal_83    = Schedule.new(day_week: "Martes"    , hour_since: tiempo_nueve_mañana  , hour_until: tiempo_trece_tarde     ,  subsidiary: sucursal_83)
horario_miercoles_sucursal_83 = Schedule.new(day_week: "Miercoles" , hour_since: tiempo_diez_mañana   , hour_until: tiempo_catorce_tarde   ,  subsidiary: sucursal_83)
horario_jueves_sucursal_83    = Schedule.new(day_week: "Jueves"    , hour_since: tiempo_once_mañana   , hour_until: tiempo_quince_tarde    ,  subsidiary: sucursal_83)
horario_viernes_sucursal_83   = Schedule.new(day_week: "Viernes"   , hour_since: tiempo_doce_mañana   , hour_until: tiempo_dieciseis_tarde ,  subsidiary: sucursal_83)

horario_lunes_sucursal_79     = Schedule.new(day_week: "Lunes"     , hour_since: tiempo_ocho_mañana   , hour_until: tiempo_doce_mañana     ,  subsidiary: sucursal_79)
horario_martes_sucursal_79    = Schedule.new(day_week: "Martes"    , hour_since: tiempo_nueve_mañana  , hour_until: tiempo_trece_tarde     ,  subsidiary: sucursal_79)
horario_viernes_sucursal_79   = Schedule.new(day_week: "Viernes"   , hour_since: tiempo_diez_mañana   , hour_until: tiempo_catorce_tarde   ,  subsidiary: sucursal_79)

horario_lunes_sucursal_200    = Schedule.new(day_week: "Lunes"     , hour_since: tiempo_ocho_mañana   , hour_until: tiempo_doce_mañana     ,  subsidiary: sucursal_200)
horario_martes_sucursal_200   = Schedule.new(day_week: "Martes"    , hour_since: tiempo_nueve_mañana  , hour_until: tiempo_trece_tarde     ,  subsidiary: sucursal_200)

horario_lunes_sucursal_116    = Schedule.new(day_week: "Lunes"     , hour_since: tiempo_ocho_mañana   , hour_until: tiempo_doce_mañana     ,  subsidiary: sucursal_116)
horario_viernes_sucursal_116  = Schedule.new(day_week: "Viernes"   , hour_since: tiempo_nueve_mañana  , hour_until: tiempo_trece_tarde     ,  subsidiary: sucursal_116)

horario_lunes_sucursal_111    = Schedule.new(day_week: "Lunes"     , hour_since: tiempo_diez_mañana   , hour_until: tiempo_once_mañana     ,  subsidiary: sucursal_111)

horario_lunes_sucursal_83.save()
horario_martes_sucursal_83.save()
horario_miercoles_sucursal_83.save()
horario_jueves_sucursal_83.save()
horario_viernes_sucursal_83.save()

horario_lunes_sucursal_79.save()
horario_martes_sucursal_79.save()
horario_viernes_sucursal_79.save()

horario_lunes_sucursal_200.save()
horario_martes_sucursal_200.save()

horario_lunes_sucursal_116.save()
horario_viernes_sucursal_116.save()
horario_lunes_sucursal_111.save()

puts "Se cargaron los horarios con exito"
# Creamos usuarios

usuario_admin      = User.new( email: 'admin@gmail.com'    , password: '123456789' , password_confirmation: '123456789' , name: 'admin' , role: 1)
usuario_bank       = User.new( email: 'empleado@gmail.com' , password: '123456789' , password_confirmation: '123456789' , name: 'bank'  , role: 2, subsidiary: sucursal_83)
usuario_client     = User.new( email: 'cliente@gmail.com'  , password: '123456789' , password_confirmation: '123456789' , name: 'cliente')
usuario_client_2   = User.new( email: 'cliente2@gmail.com' , password: '123456789' , password_confirmation: '123456789' , name: 'cliente2')
usuario_client_3   = User.new( email: 'cliente3@gmail.com' , password: '123456789' , password_confirmation: '123456789' , name: 'cliente3')
usuario_client_4   = User.new( email: 'cliente4@gmail.com' , password: '123456789' , password_confirmation: '123456789' , name: 'cliente4')

usuario_admin.save()
usuario_bank.save()
usuario_client.save()
usuario_client_2.save()
usuario_client_3.save()
usuario_client_4.save()

puts "Se cargaron los usuarios con exito"
# Creamos turnos

turno_0   = Turn.new(turn_date: fecha_2022_diciembre_18  , hour: tiempo_nueve_mañana      , reason_turn: "Renovacion de la tarjeta"    , subsidiary: sucursal_83   , state: 'Pendiente'  , user_client: usuario_client)
turno_1   = Turn.new(turn_date: fecha_2022_diciembre_19  , hour: tiempo_diez_mañana       , reason_turn: "Dar de baja la tarjeta"      , subsidiary: sucursal_79   , state: 'Pendiente'  , user_client: usuario_client)
turno_2   = Turn.new(turn_date: fecha_2022_diciembre_20  , hour: tiempo_once_mañana       , reason_turn: "Pedido de factura"           , subsidiary: sucursal_111  , state: 'Atendido'   , user_client: usuario_client)
turno_3   = Turn.new(turn_date: fecha_2022_diciembre_21  , hour: tiempo_doce_mañana       , reason_turn: "Baja de tarjeta de debito"   , subsidiary: sucursal_116  , state: 'Pendiente'  , user_client: usuario_client)
turno_4   = Turn.new(turn_date: fecha_2022_diciembre_22  , hour: tiempo_trece_tarde       , reason_turn: "Tarjeta retenida por cajero" , subsidiary: sucursal_83   , state: 'Pendiente'  , user_client: usuario_client)
turno_5   = Turn.new(turn_date: fecha_2022_diciembre_23  , hour: tiempo_trece_tarde       , reason_turn: "Los cajeros no funcionan"    , subsidiary: sucursal_79   , state: 'Pendiente'  , user_client: usuario_client)
turno_6   = Turn.new(turn_date: fecha_2022_diciembre_26  , hour: tiempo_once_mañana       , reason_turn: "Vencimiento de la tarjeta"   , subsidiary: sucursal_111  , state: 'Atendido'   , user_client: usuario_client)
turno_7   = Turn.new(turn_date: fecha_2022_diciembre_27  , hour: tiempo_catorce_tarde     , reason_turn: "Cambio de tarjeta gastada"   , subsidiary: sucursal_116  , state: 'Pendiente'  , user_client: usuario_client)
turno_8   = Turn.new(turn_date: fecha_2022_octubre_2     , hour: tiempo_doce_mañana       , reason_turn: "Horarios de atencion cortos" , subsidiary: sucursal_83   , state: 'Atendido'   ,  user_client: usuario_client)
turno_9   = Turn.new(turn_date: fecha_2022_diciembre_28  , hour: tiempo_trece_tarde       , reason_turn: "Modificacion de datos"       , subsidiary: sucursal_79   , state: 'Pendiente'  , user_client: usuario_client_2)
turno_10  = Turn.new(turn_date: fecha_2022_diciembre_18  , hour: tiempo_quince_tarde      , reason_turn: "Problema con home banking"   , subsidiary: sucursal_79   , state: 'Pendiente'  , user_client: usuario_client_2)
turno_11  = Turn.new(turn_date: fecha_2022_diciembre_19  , hour: tiempo_dieciseis_tarde   , reason_turn: "Cambio de contraseñas"       , subsidiary: sucursal_111  , state: 'Atendido'   , user_client: usuario_client_2)
turno_12  = Turn.new(turn_date: fecha_2022_diciembre_20  , hour: tiempo_diecisiete_tarde  , reason_turn: "Cajeros sin dolares"         , subsidiary: sucursal_116  , state: 'Pendiente'  , user_client: usuario_client_2)
turno_13  = Turn.new(turn_date: fecha_2022_diciembre_21  , hour: tiempo_dieciocho_tarde   , reason_turn: "Baja del sistema"            , subsidiary: sucursal_83   , state: 'Pendiente'  , user_client: usuario_client_2)

turno_0.save()
turno_1.save()
turno_2.save()
turno_3.save()
turno_4.save()
turno_5.save()
turno_6.save()
turno_7.save()
turno_8.save()
turno_9.save()
turno_10.save()
turno_11.save()
turno_12.save()
turno_13.save()

puts "Se cargaron los turnos con exito"


puts "Datos cargados"