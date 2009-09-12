require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_versioned/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsVersioned::Macros
end