require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_state_machine/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsStateMachine::Macros
end