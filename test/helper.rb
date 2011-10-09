require 'bundler/setup'
require 'minitest/autorun'

unless Object.const_defined? 'Netstring'
  $:.unshift File.expand_path '../../lib', __FILE__
  require 'netstring'
end
