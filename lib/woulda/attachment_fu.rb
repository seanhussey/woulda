require 'shoulda'
require 'woulda/attachment_fu/macros'

Test::Unit::TestCase.class_eval
  extend Woulda::AttachmentFu::Macros
end