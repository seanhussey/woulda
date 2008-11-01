require 'shoulda'
require File.dirname(__FILE__) + '/enumerations_mixin/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::EnumerationsMixin::Macros
end