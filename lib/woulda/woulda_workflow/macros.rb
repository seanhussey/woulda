module Woulda
  module WouldaWorkflow
    module Macros
      # Example:
      #
      # class Order < ActiveRecord::Base
      # include Workflow
      # workflow do
      # acts_as_state_machine :initial => :open
      #
      # state :open do
      # event :close_order, :transitions_to => :closed
      # end
      # end
      #
      # class OrderTest < Test::Unit::TestCase
      #
      # # check the inital state
      # should_have_workflow :initial => :open
      #
      # # check states in addition to :initial
      # should_have_workflow :initial => :open, :states => [:closed]
      #
      # # check events and transitions
      # should_have_workflow :events => {:close_order => {:to => :closed, :from => :open}}
      #
      # # check workflow database column
      # should_have_workflow :db_column => :legacy_column
      #
      # should_have_workflow :initial => :open, :states => [:closed], :events => {:close_order => {:to => :closed, :from => :open}}
      # end
      #
      def should_have_workflow(opts={})
        klass = described_type

        initial_state, states, events, db_column = get_options!([opts], :initial, :states, :events, :workflow_column)
        #initial_state, states, db_column = get_options!([opts], :initial, :states, :workflow_column)
        
        states ||= []
        events ||= {}
        db_column ||= :workflow_state

        context "A #{klass.name}" do

          should "specify the intended database column for Workflow" do
            assert_equal db_column, klass.workflow_column
          end
          
          should_have_db_column db_column

          should "include the Workflow module" do
            assert klass.included_modules.include?(Workflow)
          end

          should "define Workflow class methods" do
             assert klass.extended_by.include?(Workflow::WorkflowClassMethods), "#{klass} doesn't define Workflow class methods"
          end

          should "define Workflow instance methods" do
            assert klass.include?(Workflow::WorkflowInstanceMethods), "#{klass} doesn't define Workflow instance methods"
          end

          should "have an intital state of #{initial_state}" do
            assert_equal initial_state, klass.workflow_spec.initial_state.name.to_sym, "#{klass} does not have an initial state of #{initial_state}"
          end

          states.each do |state|
            should "include state #{state}" do
              assert klass.workflow_spec.states.include?(state), "#{klass} does not include state #{state}"
            end
          end

          events.each do |event, transition|
            from = transition[:from]
            to = transition[:to]
            
            should "define an event #{event} on state #{from}" do
              assert klass.workflow_spec.states[from].events.has_key?(event), "#{klass} does not define event #{event} on state #{from}"
            end
          
            should "transition to #{to} from #{from} on event #{event}" do
              assert_equal to, klass.workflow_spec.states[from].events[event].transitions_to, "#{event} does not transition to #{to} from #{from}"
            end
          end
        end

      end
    end
  end
end
