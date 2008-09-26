require 'shoulda'
require 'woulda/acts_as_taggable_on_steroids'

Test::Unit::TestCase.class_eval do
  extend Woulda::ActsAsTaggableOnSteroids::Macros
end