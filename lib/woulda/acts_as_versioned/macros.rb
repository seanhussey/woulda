module Woulda
  module ActsAsVersioned
    module Macros
      def should_act_as_versioned
        klass = model_class
        should_have_db_table "#{klass}_versions".tableize
        should_have_db_column :version
        
        context "A #{klass.name}" do
          should "include acts as versioned" do
            assert klass.included_modules.include?(ActiveRecord::Acts::Versioned), "#{klass.name} should act_as_versioned"
          end
          
          should "be versioned" do
            assert_respond_to klass, :acts_as_versioned, "#{klass.name} should act_as_versioned"            
          end
          
        end        
      end
    end
  end
end