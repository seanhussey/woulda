require 'shoulda'
require File.dirname(__FILE__) + '/woulda_workflow/macros' 

Test::Unit::TestCase.class_eval do
  extend Woulda::WouldaWorkflow::Macros
end