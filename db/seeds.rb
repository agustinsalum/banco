# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


puts "Empezamos a cargar los datos"

# Otros
fecha_hoy = DateTime.now()

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

localidad_necochea      = Locality.new(name_locality: 'Necochea', province: provincia_buenos_aires)
localidad_la_plata      = Locality.new(name_locality: 'La Plata', province: provincia_buenos_aires)
localidad_perito_moreno = Locality.new(name_locality: 'Perito moreno', province: provincia_santa_cruz)
localidad_calamuchita   = Locality.new(name_locality: 'Calamuchita', province: provincia_cordoba)

localidad_necochea.save()
localidad_la_plata.save()
localidad_perito_moreno.save()

puts "Se cargaron las localidades con exito"
# Creamos sucursales

sucursal_83   = Subsidiary.new(name_subsidiary: 'Villa Diaz Velez', address: 'Calle 83', phone: '2262000000', locality: localidad_necochea)
sucursal_79   = Subsidiary.new(name_subsidiary: 'Diagonal 79 - playa', address: 'Avenida 79', phone: '2262000001', locality: localidad_necochea)
sucursal_116  = Subsidiary.new(name_subsidiary: 'Banco perito moreno', address: 'Esquina 116', phone: '2262000001', locality: localidad_perito_moreno)
sucursal_111  = Subsidiary.new(name_subsidiary: 'Calamuchita bank', address: 'Esquina 111', phone: '2262000001', locality: localidad_calamuchita)


sucursal_83.save()
sucursal_79.save()
sucursal_116.save()
sucursal_111.save()

puts "Se cargaron las sucursales con exito"
# Creamos horarios para sucursales

horario_lunes_sucursal_83     = Schedule.new(day_week: "Lunes",     hour_since: '08:00', hour_until: '12:00', subsidiary: sucursal_83)
horario_martes_sucursal_83    = Schedule.new(day_week: "Martes",    hour_since: '09:00', hour_until: '13:00', subsidiary: sucursal_83)
horario_miercoles_sucursal_83 = Schedule.new(day_week: "Miercoles", hour_since: '10:00', hour_until: '14:00', subsidiary: sucursal_83)
horario_jueves_sucursal_83    = Schedule.new(day_week: "Jueves",    hour_since: '11:00', hour_until: '15:00', subsidiary: sucursal_83)
horario_viernes_sucursal_83   = Schedule.new(day_week: "Viernes",   hour_since: '12:00', hour_until: '16:00', subsidiary: sucursal_83)

horario_lunes_sucursal_79     = Schedule.new(day_week: "Lunes",     hour_since: '08:00', hour_until: '12:00', subsidiary: sucursal_79)
horario_martes_sucursal_79    = Schedule.new(day_week: "Martes",    hour_since: '09:00', hour_until: '13:00', subsidiary: sucursal_79)
horario_viernes_sucursal_79   = Schedule.new(day_week: "Viernes",   hour_since: '10:00', hour_until: '14:00', subsidiary: sucursal_79)

horario_lunes_sucursal_116    = Schedule.new(day_week: "Lunes",     hour_since: '08:00', hour_until: '12:00', subsidiary: sucursal_116)
horario_viernes_sucursal_116  = Schedule.new(day_week: "Viernes",   hour_since: '10:00', hour_until: '14:00', subsidiary: sucursal_116)

horario_lunes_sucursal_111    = Schedule.new(day_week: "Lunes",     hour_since: '08:00', hour_until: '12:00', subsidiary: sucursal_111)

horario_lunes_sucursal_83.save()
horario_martes_sucursal_83.save()
horario_miercoles_sucursal_83.save()
horario_jueves_sucursal_83.save()
horario_viernes_sucursal_83.save()

horario_lunes_sucursal_79.save()
horario_martes_sucursal_79.save()
horario_viernes_sucursal_79.save()

horario_lunes_sucursal_116    = Schedule.new(day_week: "Lunes",     hour_since: '08:00', hour_until: '12:00', subsidiary: sucursal_116)
horario_viernes_sucursal_116  = Schedule.new(day_week: "Viernes",   hour_since: '10:00', hour_until: '14:00', subsidiary: sucursal_116)

horario_lunes_sucursal_111    = Schedule.new(day_week: "Lunes",     hour_since: '08:00', hour_until: '12:00', subsidiary: sucursal_111)


puts "Se cargaron los horarios con exito"
# Creamos usuarios

usuario_admin      = User.new( email: 'admin@gmail.com', password: '123456789', password_confirmation: '123456789', name: 'admin', role: 1)
usuario_bank       = User.new( email: 'empleado@gmail.com', password: '123456789', password_confirmation: '123456789', name: 'bank', role: 2, subsidiary: sucursal_83)
usuario_client     = User.new( email: 'cliente@gmail.com', password: '123456789', password_confirmation: '123456789', name: 'cliente')
usuario_client_2   = User.new( email: 'cliente2@gmail.com', password: '123456789', password_confirmation: '123456789', name: 'cliente2')

usuario_admin.save()
usuario_bank.save()
usuario_client.save()

puts "Se cargaron los usuarios con exito"
# Creamos turnos

turno_1 = Turn.new(turn_date: fecha_hoy, hour: '09:00', reason_turn: "Renovacion de la tarjeta"    , subsidiary: sucursal_83   , state: 'Pendiente', user_client: usuario_client)
turno_2 = Turn.new(turn_date: fecha_hoy, hour: '10:00', reason_turn: "Dar de baja la tarjeta"      , subsidiary: sucursal_79   , state: 'Pendiente', user_client: usuario_client)
turno_3 = Turn.new(turn_date: fecha_hoy, hour: '11:00', reason_turn: "Pedido de factura"           , subsidiary: sucursal_79   , state: 'Pendiente', user_client: usuario_client)
turno_4 = Turn.new(turn_date: fecha_hoy, hour: '12:00', reason_turn: "Baja de tarjeta de debito"   , subsidiary: sucursal_111  , state: 'Pendiente', user_client: usuario_client)
turno_5 = Turn.new(turn_date: fecha_hoy, hour: '13:00', reason_turn: "Tarjeta retenida por cajero" , subsidiary: sucursal_116  , state: 'Pendiente', user_client: usuario_client)
turno_6 = Turn.new(turn_date: fecha_hoy, hour: '14:00', reason_turn: "Alta de tarjeta "            , subsidiary: sucursal_83   , state: 'Pendiente', user_client: usuario_client)
turno_7 = Turn.new(turn_date: fecha_hoy, hour: '15:00', reason_turn: "Problema con home banking"   , subsidiary: sucursal_79   , state: 'Pendiente', user_client: usuario_client)
turno_8 = Turn.new(turn_date: fecha_hoy, hour: '16:00', reason_turn: "Cambio de contraseñas"       , subsidiary: sucursal_111  , state: 'Pendiente', user_client: usuario_client)
turno_9 = Turn.new(turn_date: fecha_hoy, hour: '17:00', reason_turn: "Cajeros sin dolares"         , subsidiary: sucursal_79   , state: 'Pendiente', user_client: usuario_client_2)
turno_10 = Turn.new(turn_date: fecha_hoy, hour: '18:00', reason_turn: "Baja del sistema"           , subsidiary: sucursal_83   , state: 'Pendiente', user_client: usuario_client_2)

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

puts "Se cargaron los turnos con exito"


puts "Datos cargados"