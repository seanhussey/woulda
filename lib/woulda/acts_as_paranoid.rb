require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_paranoid/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsParanoid::Macros
end