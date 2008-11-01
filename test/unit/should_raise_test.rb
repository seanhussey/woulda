require File.dirname(__FILE__) + '/../test_helper'

# TODO
# - Add tests that verify correct behavior when nothing is raised
# - Add tests for Ruby 1.9?

class ShouldRaiseTest < Test::Unit::TestCase
  # All of the basic Ruby 1.8 exceptions, except for 'fatal'
  EXCEPTIONS = [
    Exception,
      NoMemoryError, 
      ScriptError, 
        LoadError, 
        NotImplementedError, 
        SyntaxError, 
      SecurityError, 
      SignalException, 
        Interrupt, 
      StandardError, 
        ArgumentError, 
        IndexError, 
        IOError, 
          EOFError, 
        LocalJumpError, 
        NameError,
          NoMethodError, 
        RangeError, 
          FloatDomainError, 
        RegexpError, 
        RuntimeError, 
        SystemCallError, 
        ThreadError, 
        TypeError, 
        ZeroDivisionError,
      SystemExit, 
      SystemStackError]
  
  EXCEPTIONS_WITH_PARAMS = {
    Interrupt => 0,
    SystemCallError => 2,
    SignalException => 2
  }
  
  PLAIN_EXCEPTIONS = EXCEPTIONS - EXCEPTIONS_WITH_PARAMS.keys

  context "Raising all the types of exceptions" do
    PLAIN_EXCEPTIONS.each do |x|
      context "for exception #{x.inspect}, with a straight exception class argument" do
        should_raise(x) { raise x }
      end
    end
    
    EXCEPTIONS_WITH_PARAMS.each_pair do |x, p|
      context "for exception #{x.inspect} with param #{p.inspect}, with a :kind_of exception" do
        should_raise(:kind_of => x) { raise x, p }
      end
    end
    
    (PLAIN_EXCEPTIONS - [SystemCallError]).each do |x|
      context "for exception #{x.inspect}, with an :instance_of exception" do
        should_raise(:instance_of => x) { raise x }
      end
    end
  end
  
  context "Using an unknown param_type" do
    # Testing should_raise with should_raise. Awesome.
    should_raise(ArgumentError, :message => /:unknown_param_type/) do
      should_raise(:unknown_param_type => 'foo') {}
    end
  end
  
  should_raise do
    require "more vespene gas"
  end
  # 1 assertion
  
  should_raise(LoadError) do
    require "more vespene gas"
  end
  # 1 more restrictive assertion
  
  should_raise(:instance_of => LoadError) do
    require "more vespene gas"
  end
  # 1 assertion, the same as should_raise(LoadError)
  
  should_raise(:kind_of => ScriptError) do
    require "more vespene gas"
  end
  # 1 assertion, slightly less strict than with :instance_of (note: LoadError < ScriptError)
  
  should_raise(:kind_of => LoadError) do
    require "more vespene gas"
  end
  
  should_raise(:message => "no such file to load") do
    require "more vespene gas"
  end
  # 2 assertions
  
  should_raise(:message => /vespene/) do
    require "more vespene gas"
  end
  # 2 assertions
  
  should_raise(LoadError, :message => "such file to load") do
    require "more vespene gas"
  end
  # 2 assertions
  
  should_raise(:kind_of => LoadError, :message => "file to load") do
    require "more vespene gas"
  end
  # 2 assertions
  
  should_raise(:instance_of => LoadError, :message => "to load") do
    require "more vespene gas"
  end
  # 2 assertions
end

