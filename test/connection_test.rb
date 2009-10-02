require "test_helper"

class ConnectionTest < Test::Unit::TestCase
  def test_connection_creation_without_arguments
    c = Connection.new
    %w(ENDPOINT API_KEY USERNAME).each do |a|
      assert_equal(Connection.const_get(a), c.send(a.downcase.to_sym))
    end
  end
  
  def test_connection_creation_with_arguments
    options = {:username => 'john_smith', :key => 'whatever', :endpoint => 'http://google.com/'}
    c = Connection.new(options)
    %w(ENDPOINT API_KEY USERNAME).each do |a|
      assert_not_equal(Connection.const_get(a), c.send(a.downcase.to_sym))
    end
  end
end