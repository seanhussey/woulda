require 'shoulda'
require 'woulda/acts_as_paranoid/macros'

module Test # :nodoc: all
  module Unit
    class TestCase
      extend Woulda::ActsAsParanoid::Macros
    end
  end
end
