require "test_helper"

class RequestTest < Test::Unit::TestCase
  def test_standard_response_keys
    assert_equal(Request.const_get('STANDARD_RESPONSE_KEYS'), ['ShipAction', 'Status', 'RequestDate', 'Username'])
  end
  
  def test_request_needs_connection_to_initialize
    c = Connection.new
    
    assert_raise(ArgumentError) { Request.new }
    assert_raise(RuntimeError) { Request.new(String.new) }
    assert_nothing_raised(RuntimeError) do
      r = Request.new(c)
      assert_same(r.instance_variable_get("@connection"), c)
    end
  end
end