module Woulda
  module ActsAsList
    module Macros
      # Original source: http://www.soyunperdedor.com/node/34
      def should_act_as_list
        klass = self.name.gsub(/Test$/, '').constantize

        context "To support acts_as_list" do
          should_have_db_column('position', :type => :integer)
        end

        should "include ActsAsList methods" do
          assert klass.include?(ActiveRecord::Acts::List::InstanceMethods)
        end

        should_have_instance_methods :acts_as_list_class, :position_column, :scope_condition
      end
    end
  end
end