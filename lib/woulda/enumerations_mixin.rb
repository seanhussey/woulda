require 'shoulda'
require 'woulda/enumerations_mixin/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::EnumerationsMixin::Macros
end