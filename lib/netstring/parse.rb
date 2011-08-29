module Netstring
  SIZE = '\d{1,9}'
  COLON = ':'
  DATA = '.*'
  STRING_TYPE = ','
  INT_TYPE = '#'
  FLOAT_TYPE = '\^'
  BOOLEAN_TYPE = '!'
  NULL_TYPE = '~'
  DICT_TYPE = '\}'
  LIST_TYPE = '\]'
  TYPE = "#{STRING_TYPE}|#{INT_TYPE}|#{FLOAT_TYPE}|#{BOOLEAN_TYPE}|#{NULL_TYPE}|#{DICT_TYPE}|#{LIST_TYPE}"
  DEFINITION = /((#{SIZE})#{COLON}(#{DATA})(#{TYPE}))+/

  # => Netstring.parse(String or nil)
  #
  # This is the method that parses TNetString data.
  def self.parse(data=nil)

    # If the data passed is bad, make into empty tns:string
    data = "0:," if data == nil || data == "" || !data.is_a?(String) || data.split(":", 2).first.to_i =~ /#{SIZE}/

    # Check to see if all the data is null, else parse data
    if data =~ /\A0:#{NULL_TYPE}\z/
      nil
    else
      # Try to parse the data, with it being split by
      parse_payload *data.split(':', 2)
    end

  end

  def self.parse_payload(bytes, data)
    bytes = bytes.to_i
    terminator = data.scan(/.{1}\z/).first
    body = data.scan(/\A(.*)#{terminator}\z/).first.first

    # Check to see if the size of the body matches the byte count
    if body.length == bytes
      case terminator
      when STRING_TYPE then body
      when INT_TYPE then body.to_i
      when FLOAT_TYPE then body.to_f
      when BOOLEAN_TYPE then parse_boolean(body)
      when NULL_TYPE then nil
      when DICT_TYPE then parse_dictionary(body)
      when LIST_TYPE then parse_list(body)
      end
    else
      raise ByteLengthError, "The byte count was incorrect: #{bytes} (byte count) vs. #{body.length} (data length)"
    end
  end

  def self.parse_boolean(data)
    boolean_match = /\Atrue|false\Z/
    if data =~ boolean_match
      if data == "true"
        true
      else
        false
      end
    else
      raise TypeError, "Not 'true' or 'false': #{data}"
    end
  end

end
