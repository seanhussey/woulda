module Woulda
  module ActsAsParanoid
    module Macros
      def should_act_as_paranoid
        klass = model_class
        should_have_db_column :deleted_at

        context "A #{klass.name}" do
          should "be paranoid (it will not be deleted from the database)" do
            assert klass.paranoid?
            assert klass.included_modules.include?(Caboose::Acts::Paranoid)
          end

          should "not have a value for deleted_at" do
            assert object = klass.find(:first)
            assert_nil object.deleted_at
          end

          context "when destroyed" do
            setup do
              assert object = klass.find(:first), "This context requires there to be an existing #{klass}"
              @deleted_id = object.id
              object.destroy
            end

            should "not be found" do
              assert_raise(ActiveRecord::RecordNotFound) { klass.find(@deleted_id) }
            end

            should "still exist in the database" do
              deleted_object = klass.find_with_deleted(@deleted_id)
              assert_not_nil deleted_object.deleted_at
            end
          end
        end
      end
    end
  end
end