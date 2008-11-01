require 'shoulda'
require File.dirname(__FILE__) + '/attachment_fu/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::AttachmentFu::Macros
end