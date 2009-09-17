require 'test_helper'

class SymbolTest < Test::Unit::TestCase
  def test_camelize_instance_method_is_defined
    sym = :a_symbol
    assert sym.respond_to?(:camelize)
  end
  
  def test_camelize_behaviour
    sym = :the_quick_brown_fox_1.camelize
    assert sym.is_a?(String)
    assert_equal sym, 'TheQuickBrownFox1'
  end
end
