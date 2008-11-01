require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_solr/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsSolr::Macros
end