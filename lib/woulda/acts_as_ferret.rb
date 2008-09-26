require 'shoulda'
require 'woulda/acts_as_ferret/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsFerret::Macros
end