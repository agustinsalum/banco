# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'bcrypt'

# Creamos provincias

provincia_buenos_aires = Province.new(name_province: 'Buenos aires')
provincia_santa_cruz   = Province.new(name_province: 'Santa cruz')

# Creamos localidades

localidad_necochea = Locality.new(name_locality: 'Necochea', province: provincia_buenos_aires)
localidad_la_plata = Locality.new(name_locality: 'La Plata', province: provincia_buenos_aires)

# Creamos sucursales

sucursal_83 = Subsidiary.new(address: 'Calle 83', phone: '2262000000', locality: localidad_necochea)
sucursal_79 = Subsidiary.new(address: 'Avenida 79', phone: '2262000001', locality: localidad_necochea)

# Creamos usuarios

usuario_admin    = User.new(email: 'admin@gmail.com', password: 123456789, name: 'Admin', role: 1)
usuario_empleado = User.new(email: 'empleado@gmail.com', password: BCrypt::Password.create("empleado"), password_confirmation: 'empleado' , name: 'Empleado', role: 2)
usuario_cliente  = User.new(email: 'cliente@gmail.com', password: BCrypt::Password.create("clientee"), password_confirmation: 'cliente' , name: 'Cliente', role: 3)

# Crear

provincia_buenos_aires.save()
provincia_santa_cruz.save()

localidad_necochea.save()
localidad_la_plata.save()

sucursal_83.save()
sucursal_79.save()

usuario_admin.save()
usuario_empleado.save()
usuario_cliente.save()