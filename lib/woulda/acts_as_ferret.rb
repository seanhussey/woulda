require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_ferret/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsFerret::Macros
end