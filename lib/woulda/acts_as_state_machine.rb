require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_state_machine/macros_old' unless const_defined?(AASM)
require File.dirname(__FILE__) + '/acts_as_state_machine/macros_new' if const_defined?(AASM)

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsStateMachine::Macros
end