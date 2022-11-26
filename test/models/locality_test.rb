require "test_helper"

class LocalityTest < ActiveSupport::TestCase
  def setup
    @una_provincia = Province.new(name_province: 'Buenos aires test' )
    @una_provincia.save
  end

  def test_valido
    una_localidad_valida = Locality.new(name_locality: 'Necochea test', province: @una_provincia )
    assert una_localidad_valida.valid?
    assert una_localidad_valida.save
  end
  
  # Falta la provincia que es una fk obligatoria
  def test_no_valido_fk
    una_localidad_no_valida = Locality.new(name_locality: 'Necochea test' )
    assert_not una_localidad_no_valida.valid?
    assert_not una_localidad_no_valida.save
  end
  
  # Falta la provincia que es una fk obligatoria
  def test_no_valido_asociacion
    una_localidad_valida = Locality.new(name_locality: 'Necochea test', province: @una_provincia )
    una_localidad_valida.save()
    una_localidad_no_valida = Locality.new(name_locality: 'Mar del plata test', province: @una_provincia )
    assert_not una_localidad_no_valida.valid?
    assert_not una_localidad_no_valida.save
  end
  
  # Se repite la ciudad para una provincia
  def test_no_valido_asociacion
    una_localidad_valida = Locality.new(name_locality: 'Necochea test', province: @una_provincia )
    una_localidad_valida.save()
    una_localidad_no_valida = Locality.new(name_locality: 'Necochea test', province: @una_provincia )
    assert_not una_localidad_no_valida.valid?
    assert_not una_localidad_no_valida.save
  end
end
