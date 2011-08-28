require 'minitest/autorun'
require 'netstring'

class TestNebStringParser < MiniTest::Unit::TestCase

  def setup
    @size  = '\d{1,9}'
    @colon = ':'
    @data  = '.*'
    @string_type = ','
    @int_type = '#'
    @float_type = '\^'
    @boolean_type = '!'
    @null_type = '~'
    @dict_type = '\}'
    @list_type = '\]'
    @type = "#{@string_type}|#{@int_type}|#{@float_type}|#{@boolean_type}|#{@null_type}|#{@dict_type}|#{@list_type}"
    @definition = /(#{@size})#{@colon}(#{@data})(#{@type})/
  end

  def test_parser_size_regex
    assert_equal @size, Netstring::SIZE
  end

  def test_parser_colon_regex
    assert_equal @colon, Netstring::COLON
  end

  def test_parser_data_regex
    assert_equal @data, Netstring::DATA
  end

  def test_parser_data_regex
    assert_equal @string_type, Netstring::STRING_TYPE
  end

  def test_parser_data_regex
    assert_equal @int_type, Netstring::INT_TYPE
  end

  def test_parser_data_regex
    assert_equal @float_type, Netstring::FLOAT_TYPE
  end

  def test_parser_data_regex
    assert_equal @boolean_type, Netstring::BOOLEAN_TYPE
  end

  def test_parser_data_regex
    assert_equal @null_type, Netstring::NULL_TYPE
  end

  def test_parser_data_regex
    assert_equal @dict_type, Netstring::DICT_TYPE
  end

  def test_parser_data_regex
    assert_equal @list_type, Netstring::LIST_TYPE
  end

  def test_parser_type_regex
    assert_equal @type, Netstring::TYPE
  end

  def test_pareser_definition_regex
    assert_equal @definition, Netstring::DEFINITION
  end

  def test_parser_definition_matches_basics
    assert "4:love," =~ @definition
  end

  def test_parser_returns_nil
    assert_equal nil, Netstring.parse("0:~")
  end

  def test_parser_returns_native_string
    assert_equal "Hello, World!", Netstring.parse("13:Hello, World!,")
  end

  def test_parser_byte_error

  end
end