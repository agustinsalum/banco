require "test_helper"

class ProvinceTest < ActiveSupport::TestCase
  def test_valido
    una_provincia_valida = Province.new(name_province: 'Buenos aires' )
    assert una_provincia_valida.valid?
  end

  # Falta el nombre de la provincia que tiene validacion obligatoria
  def test_no_valido
    una_provincia_no_valida = Province.new()
    assert_not una_provincia_no_valida.valid?
  end
end
