require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_list/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsList::Macros
end