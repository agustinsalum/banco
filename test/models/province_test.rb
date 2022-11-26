require "test_helper"

class ProvinceTest < ActiveSupport::TestCase
  def test_valido
    una_provincia_valida = Province.new(name_province: 'Buenos aires test' )
    assert una_provincia_valida.valid?
    assert una_provincia_valida.save
  end

  # Falta el nombre de la provincia que tiene validacion obligatoria
  def test_no_valido
    una_provincia_no_valida = Province.new()
    assert_not una_provincia_no_valida.valid?
    assert_not una_provincia_no_valida.save
  end
end
