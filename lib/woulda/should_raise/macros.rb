# Copyright (c) 2008 Mathieu Martin
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

# TODO
# - nest contexts/should differently so the message verifications don't clobber each other.
#   Put exactly same message in last few tests for an example.

module Woulda
  module ShouldRaise
    module Macros
      # Make sure a block raises an exception.
      # Call with optional arguments :instance_of/:kind_of and :message
      # If :instance_of or :kind_of is specified, assert on the given type. 
      #   Otherwise only assert that an exception is raised.
      #   Note: The shorthand should_raise(LoadError) is equivalent to should_raise(:instance_of => LoadError)
      # If :message is specified, will assert that exception.message =~ :message.
      #
      # Examples:
      #   should_raise {a block}
      #   should_raise(LoadError) {a block}
      #   should_raise(:instance_of => LoadError) {a block}
      #   should_raise(:kind_of => LoadError) {a block}
      #   should_raise(:message => "no such file to load") {a block}
      #   should_raise(:message => /load/) {a block}
      #   should_raise(LoadError, :message => /load/) {a block}
      #   should_raise(:kind_of => LoadError, :message => /load/) {a block}
      #   should_raise(:instance_of => LoadError, :message => /load/) {a block}
      def should_raise(*args, &block)
        opts = args.last.is_a?(Hash) ? args.pop : {}

        if args.first.is_a?(Class)
          type  = args.first
          exact = true
        else
          type  = opts[:instance_of] || opts[:kind_of]
          exact = !!opts[:instance_of]
        end
        message = opts[:message]

        # Make sure we don't have a false sense of security and bork if incorrect options are supplied.
        [:message, :instance_of, :kind_of].each { |acceptable_arg| opts.delete(acceptable_arg) }
        raise ArgumentError, "Unknown parameter(s): #{opts.keys.inspect}. Only :message, :instance_of and :kind_of are supported." if opts.size > 0

        context "block #{block.inspect}" do # To avoid dupe test names. Any other ideas?
          should_string  = "raise an exception"
          should_string += " %s type #{type.inspect}" % (exact ? 'of' : 'descending from') if type
          
          should should_string do
            begin
              instance_eval &block
            rescue Exception => ex
              @raised_exception = ex
            end
            if @raised_exception && type
              if exact
                assert_instance_of type, @raised_exception
              else
                assert_kind_of type, @raised_exception
              end
            else
              assert @raised_exception, "The block was expected to raise an exception, but didn't"
            end
          end
        end

        if message
          context "raising an exception" do
            setup do
              begin
                instance_eval &block
              rescue Exception => ex
                @raised_exception = ex
              end
            end

            should "contain a message that matches #{message.inspect}" do
              assert_match message, @raised_exception.message
            end
          end
        end
      end
    end
  end
end
