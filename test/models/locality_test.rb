require "test_helper"

class LocalityTest < ActiveSupport::TestCase
  def setup
    @una_provincia = Province.new(name_province: 'Buenos aires' )
  end

  def test_valido
    una_localidad_valida = Locality.new(name_locality: 'Necochea', province: @una_provincia )
    assert una_localidad_valida.valid?
  end
  
  # Falta la provincia que es una fk obligatoria
  def test_no_valido_fk
    una_localidad_no_valida = Locality.new(name_locality: 'Necochea' )
    assert_not una_localidad_no_valida.valid?
  end
  
  # Falta la provincia que es una fk obligatoria
  def test_no_valido_asociacion
    una_localidad_valida = Locality.new(name_locality: 'Necochea', province: @una_provincia )
    una_localidad_valida.save()
    una_localidad_no_valida = Locality.new(name_locality: 'Necochea', province: @una_provincia )
    assert_not una_localidad_no_valida.valid?
    end
end
