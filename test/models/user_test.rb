require "test_helper"
require 'bcrypt'

class UserTest < ActiveSupport::TestCase
  def setup
    una_provincia = Province.new(name_province: 'Buenos aires')
    una_localidad = Locality.new(name_locality: 'Necochea', province: una_provincia)
    @una_sucursal = Subsidiary.new(address: 'Calle 83', phone: '2262000000', locality: una_localidad)
  end

  def test_valido
    un_usuario_valido = User.new(email: 'agustinsalum@gmail.com', password: BCrypt::Password.create("my password"), password_confirmation: 'my password' , name: 'Agustin', role: 3, subsidiary: @una_sucursal)
    assert un_usuario_valido.valid?
  end

  # Falta el rol que tiene validacion obligatoria
  def test_no_valido
    un_usuario_no_valido = User.new(email: 'agustinsalum@gmail.com', password: BCrypt::Password.create("my password"), password_confirmation: 'my password' , name: 'Agustin', subsidiary: @una_sucursal)
    assert_not un_usuario_no_valido.valid?
  end
end
