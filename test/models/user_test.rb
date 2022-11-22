require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    una_provincia = Province.new(name_province: 'Buenos aires')
    una_localidad = Locality.new(name_locality: 'Necochea', province: una_provincia)
    @una_sucursal = Subsidiary.new(address: 'Calle 83', phone: '2262000000', locality: una_localidad)
  end

  # La sucursal es opcional (sirve para el empleado)
  def test_valido_falta_sucursal
    usuario_admin = User.new( email: 'admin@gmail.com', password: '123456789', password_confirmation: '123456789', name: 'admin', role: 1)
    assert usuario_admin.valid?
  end

  # Usuario con todos los atributos
  def test_valido_completo
    usuario_bank = User.new( email: 'empleado@gmail.com', password: '123456789', password_confirmation: '123456789', name: 'bank', role: 2, subsidiary: @una_sucursal)
    assert usuario_bank.valid?
  end

  # El rol es opcional (se setea por default el 3 para el usuario cuando se registra)
  def test_valido_falta_rol
    usuario_client = User.new( email: 'cliente@gmail.com', password: '123456789', password_confirmation: '123456789', name: 'cliente')
    assert usuario_client.valid?
  end

  # Contraseña insegura (lo configure para que sean minimo 8)
  def test_no_valido_contraseña
    usuario_admin = User.new( email: 'admin@gmail.com', password: '1234', password_confirmation: '1234', name: 'admin')
    assert_not usuario_admin.valid?
  end

    # El correo es unico
    def test_no_valido_correo
      usuario_admin   = User.new( email: 'admin@admin.com', password: '123456789', password_confirmation: '123456789', name: 'Admin')
      usuario_client  = User.new( email: 'admin@admin.com', password: '123456789', password_confirmation: '123456789', name: 'Cliente')
      assert usuario_admin.valid?
      usuario_admin.save
      assert_not usuario_client.valid?
    end
end
