# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


puts "Empezamos a cargar los datos"

# Otros
fecha_hoy = DateTime.now()
fecha_hoy_adelantada = DateTime.now()+60

puts "Se cargaron las fechas correctamente"
# Creamos provincias

provincia_buenos_aires = Province.new(name_province: 'Buenos aires')
provincia_santa_cruz   = Province.new(name_province: 'Santa cruz')

provincia_buenos_aires.save()
provincia_santa_cruz.save()

puts "Se cargaron las pronvincias con exito"
# Creamos localidades

localidad_necochea = Locality.new(name_locality: 'Necochea', province: provincia_buenos_aires)
localidad_la_plata = Locality.new(name_locality: 'La Plata', province: provincia_buenos_aires)

localidad_necochea.save()
localidad_la_plata.save()

puts "Se cargaron las pronvincias con exito"
# Creamos sucursales

sucursal_83 = Subsidiary.new(address: 'Calle 83', phone: '2262000000', locality: localidad_necochea)
sucursal_79 = Subsidiary.new(address: 'Avenida 79', phone: '2262000001', locality: localidad_necochea)

sucursal_83.save()
sucursal_79.save()

puts "Se cargaron las sucursales con exito"
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

turno_1 = Turn.new(turn_date: fecha_hoy, hour: fecha_hoy.strftime("%I:%M:%S"), reason_turn: "Renovacion de la tarjeta", subsidiary: sucursal_83, state: 'Pendiente', user_client: usuario_client)
turno_2 = Turn.new(turn_date: fecha_hoy, hour: fecha_hoy.strftime("%I:%M:%S"), reason_turn: "Quejarme", subsidiary: sucursal_79, state: 'Pendiente', user_client: usuario_client_2)
turno_3 = Turn.new(turn_date: fecha_hoy_adelantada, hour: fecha_hoy.strftime("%I:%M:%S"), reason_turn: "Debitacion", subsidiary: sucursal_83, state: 'Pendiente', user_client: usuario_client_2)

turno_1.save()
turno_2.save()
turno_3.save()

puts "Se cargaron los turnos con exito"


puts "Datos cargados"