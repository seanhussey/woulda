require 'shoulda'
require 'woulda/paperclip/macros'

Tet::Unit::TestCase.class_eval do
  extend Woulda::Paperclip::Macros
end