module Woulda
  module ActsAsStateMachine
    module Macros
      # Example:
      #
      # class Order < ActiveRecord::Base
      #   acts_as_state_machine :initial => :open
      #
      #   state :open
      #   state :closed
      #
      #   event :close_order do
      #     transitions :to => :closed, :from => :open
      #   end
      # end
      #
      # class OrderTest < Test::Unit::TestCase
      #
      #   # check the inital state
      #   should_act_as_state_machine :initial => :open
      #
      #   # check states in addition to :initial
      #   should_act_as_state_machine :initial => :open, :states => [:closed]
      #
      #   # check events and transitions
      #   should_act_as_state_machine :events => {:close_order => {:to => :closed, :from :open}}
      #
      #   should_act_as_state_machine :initial => :open, :states => [:closed], :events => {:close_order => {:to => :closed, :from :open}}
      # end
      #
      def should_act_as_state_machine(opts={})
        klass = model_class

        initial_state, states, events, db_column = get_options!([opts], :initial, :states, :events, :column)

        states ||= []
        events ||= {}
        db_column ||= :state

        context "A #{klass.name}" do

          should_have_db_column db_column

          should "include the ActsAsStateMachine module" do
            assert klass.included_modules.include?(ScottBarron::Acts::StateMachine)
          end

          should "define ActsAsStateMachine class methods" do
             assert klass.extended_by.include?(ScottBarron::Acts::StateMachine::ClassMethods), "#{klass} doesn't define ActsAsStateMachine class methods"
          end

          should "define ActsAsStateMachine instance methods" do
            assert klass.include?(ScottBarron::Acts::StateMachine::InstanceMethods), "#{klass} doesn't define ActsAsStateMachine instance methods"
          end

          should "have an intital state of #{initial_state}" do
            assert_equal initial_state, klass.initial_state, "#{klass} does not have an initial state of #{initial_state}"
          end

          states.each do |state|
            should "include state #{state}" do
              assert klass.states.include?(state), "#{klass} does not include state #{state}"
            end
          end

          events.each do |event, transition|

            should "define an event #{event}" do
              assert klass.transition_table.has_key?(event), "#{klass} does not define event #{event}"
            end

            to   = transition[:to]
            from = transition[:from].is_a?(Symbol) ? [transition[:from]] : transition[:from]

            from.each do |from_state|
              should "transition to #{to} from #{from_state} on event #{event}" do
                assert_not_nil klass.transition_table[event].detect { |t| t.to == to && t.from == from_state }, "#{event} does not transition to #{to} from #{from_state}"
              end
            end

          end
        end   

      end
    end
  end
end
