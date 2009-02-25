require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_state_machine/macros_old' unless defined?(AASM)
require File.dirname(__FILE__) + '/acts_as_state_machine/macros_new' if defined?(AASM)

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsStateMachine::Macros
end