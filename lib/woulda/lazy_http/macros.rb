#--
# Copyright (c) 2009 Phil Misiowiec (phil@webficient.com)
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

module Woulda
  module LazyHttp
    module Macros
      # Automatically generates setup, should_respond_with, and should_render_template 
      # for one or more controller actions.
      # This macro is intended for simple actions that respond to GET requests.
      # If the action expects parameters, setup your object as a hash.
      #
      #  class PageControllerTest < ActionController::TestCase
      #    lazy_get :index, :about_us, :contact, {:search => {:query => 'foo'}}
      #  end
      #
      # Also compatible with Factory Girl:
      #
      #  class MemberControllerTest < ActionController::TestCase
      #    lazy_get :show => {:id => Factory(:member).id}
      #  end
      def lazy_get(*actions)
        actions.each do |action|
          params = nil
          context "on GET to #{action}" do
            if action.is_a? Hash
              b = action.keys.first
              params = action[b]
              action = b
            end
            setup { get action, params }
            should_respond_with :success
            should_render_template action
          end
        end
      end
    end
  end
end