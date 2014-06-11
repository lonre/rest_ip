require 'helper'
require 'rest_ip'

class TestSinaAdapter < Minitest::Test
  def setup
    RestIP.rest_adapter = :sina
  end

  def test_query
    response = RestIP.query('114.114.114.114')
    refute_nil response
  end

  def test_query_country
    response = RestIP.query('114.114.114.114')
    assert_equal '中国', response.country
  end

  def test_query_invalid
    response = RestIP.query('114.114.114.X')
    assert_nil response
  end
end
