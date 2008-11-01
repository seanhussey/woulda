require 'shoulda'
require 'woulda/paperclip/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::Paperclip::Macros
end