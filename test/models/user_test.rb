require "test_helper"
require 'bcrypt'


# El rol por defecto es 3(cliente)
# No es posible probar la contraseña
class UserTest < ActiveSupport::TestCase
  def setup
    una_provincia = Province.new(name_province: 'Buenos aires')
    una_localidad = Locality.new(name_locality: 'Necochea', province: una_provincia)
    @una_sucursal = Subsidiary.new(address: 'Calle 83', phone: '2262000000', locality: una_localidad)
  end

  def test_valido
    encriptado = BCrypt::Password.create("123456789")
    un_usuario_valido = User.new(email: 'agustin@gmail.com', name: 'Agustin', role: 2, subsidiary: @una_sucursal)
    assert un_usuario_valido.valid?
  end
end
