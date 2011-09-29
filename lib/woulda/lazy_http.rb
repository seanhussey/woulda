require 'shoulda'
require 'woulda/lazy_http/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::LazyHttp::Macros
end