require "test_helper"

class StringTest < Test::Unit::TestCase
  def test_camelization
    str = "uncamelized_word"
    assert_equal "UncamelizedWord", str.camelize
  end
  
  def test_decamelization
    str = "UncamelizedWord"
    assert_equal "uncamelized_word", str.decamelize
  end
end