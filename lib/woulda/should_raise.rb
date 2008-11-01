require 'shoulda'
require 'woulda/should_raise/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::WillPaginate::Macros
end
