require 'shoulda'
require File.dirname(__FILE__) + '/paperclip/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::Paperclip::Macros
end