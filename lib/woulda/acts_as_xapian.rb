require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_xapian/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsXapian::Macros
end