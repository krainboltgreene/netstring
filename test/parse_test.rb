require 'minitest/autorun'

class TestNebStringParser < MiniTest::Unit::TestCase
  def setup
  end

  def test_netstring_version_is_integer
    assert_equal String, Netstring::VERSION.class
  end

  def test_parser_returns_nil_on_null
    assert_equal nil, Netstring.parse("(0:~)+")
  end
end