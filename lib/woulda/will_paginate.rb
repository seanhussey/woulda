require 'shoulda'
require 'woulda/will_paginate/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::WillPaginate::Macros
end