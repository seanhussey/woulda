require 'shoulda'
require File.dirname(__FILE__) + '/should_raise/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ShouldRaise::Macros
end
