module Woulda
  module EnumerationsMixin
    module Macros
      def should_act_as_enumerated(options = {})
        klass = model_class

        should_have_db_columns :name

        should "define Enumerated macro methods" do
          class_modules = (class << klass; included_modules; end)
          assert class_modules.include?(ActiveRecord::Acts::Enumerated::MacroMethods), "#{klass} doesn't define Enumerated macro methods"
        end

        should "define Enumerated class methods" do
          class_modules = (class << klass; included_modules; end)
          assert class_modules.include?(ActiveRecord::Acts::Enumerated::ClassMethods), "#{klass} doesn't define Enumerated class methods"
        end

        should "define Enumerated instance methods" do
          instance_modules = klass.included_modules
          assert instance_modules.include?(ActiveRecord::Acts::Enumerated::InstanceMethods), "#{klass} doesn't define Enumerated instance methods"
        end
      end
    end
  end
end