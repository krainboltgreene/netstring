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
    @definition = /((#{@size})#{@colon}(#{@data})(#{@type}))+/

    @examples = {
      "Hello, Eve!" => "11:Hello, Eve!,",
      1234 => "4:1234#",
      true => "4:true!",
      false => "5:false!",
      { "key" => "value" } => "11:3:age,2:24#4:name,6:Kurtis,}"
    }
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
    refute "4love" =~ @definition
  end

  def test_parser_returns_nil
    assert_equal nil, Netstring.parse("0:~")
  end

  def test_parser_byte_length_error
    assert_raises(Netstring::ByteLengthError) { Netstring.parse("400:I love Eve!,") }
  end

  def test_parser_on_basic_values
    assert_equal "Hello, Eve!", Netstring.parse(@examples["Hello, Eve!"])
    assert_equal 1234, Netstring.parse(@examples[1234])
    assert_equal true, Netstring.parse(@examples[true])
    assert_equal false, Netstring.parse(@examples[false])
  end

  def test_parser_on_dicts
    assert_equal({ "key" => "value" }, Netstring.parse(@examples[{ "key" => "value" }]))
  end
end