require 'shoulda'
require File.dirname(__FILE__) + '/acts_as_taggable_on_steroids/macros'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsTaggableOnSteroids::Macros
end