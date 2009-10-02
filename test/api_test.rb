require "test_helper"

class ApiTest < Test::Unit::TestCase
  def test_balance_returns_a_valid_float
    assert API.respond_to?(:get_balance)
    assert API.get_balance.is_a?(Float)
  end
  
  def test_countries_returns_country_hash
    assert API.respond_to?(:get_countries)
    countries = API.get_countries
    assert countries.is_a?(Hash)
    # The keys should be the ISO codes. They're all 2 letters long, so
    # if there are any left in this array, we're looking at the wrong thing
    assert_equal(countries.keys.select { |k| k.length != 2 }, [])
  end
  
  def test_get_insurance_without_specific_code
    assert API.respond_to?(:get_insurance)
    options = API.get_insurance
    assert options.is_a?(Array)
    options.each do |option|
      assert option.is_a?(OpenStruct)
      [:insurance_code, :level_name, :level_amount, :price].each do |x|
        assert option.respond_to?(x)
        assert option.insurance_code.is_a?(String)
        assert option.level_name.is_a?(String)
        assert option.level_amount.is_a?(Float)
        assert option.price.is_a?(Float)
      end
    end
  end
  
  def test_get_insurance_with_specific_code
    option = API.get_insurance('IN_1')
    assert option.is_a?(OpenStruct)
    [:insurance_code, :level_name, :level_amount, :price].each do |x|
      assert option.respond_to?(x)
      assert option.insurance_code.is_a?(String)
      assert option.level_name.is_a?(String)
      assert option.level_amount.is_a?(Float)
      assert option.price.is_a?(Float)
    end
  end
  
  def test_get_service_info_without_specific_service_code
    assert API.respond_to?(:service_info)
    # services = API.service_info
  end
end