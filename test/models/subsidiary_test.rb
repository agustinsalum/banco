require "test_helper"

class SubsidiaryTest < ActiveSupport::TestCase
  def setup
    una_provincia = Province.new(name_province: "Buenos aires")
    @una_localidad = Locality.new(name_locality: 'Necochea', province: una_provincia )
  end
  
  def test_valido
    una_sucursal_valida = Subsidiary.new(address: 'Calle 6 esquina 83 n 000',phone: '2262-000000', locality: @una_localidad)
    assert una_sucursal_valida.valid?
  end

  # Falta la localidad que es una fk obligatoria
  def test_no_valido
    una_sucursal_no_valida = Subsidiary.new(address: 'Calle 6 esquina 83 n 000',phone: '2262-000000')
    assert_not una_sucursal_no_valida.valid?
  end
end
