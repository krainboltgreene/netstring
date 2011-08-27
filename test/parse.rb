require 'minitest/autorun'

class TestNebStringParser < MiniTest::Unit::TestCase
  def setup
  end

  def test_parser_returns_nil_on_null
    assert_equal nil, Netstring.parse("(0:~)")
  end
end