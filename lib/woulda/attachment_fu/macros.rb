module Woulda
  module AttachmentFu
    module Macros
      def should_have_attachment(options = {})
        klass = model_class

        should_have_db_columns :size, :content_type, :filename
        if options[:content_type] == :image
          should_have_db_columns :height, :width
        end

        should "define AttachmentFu class methods" do
          # breakpoint
          class_modules = (class << klass; included_modules; end)
          assert class_modules.include?(Technoweenie::AttachmentFu::ClassMethods),
                                        "#{klass} doesn't define AttachmentFu class methods"
        end

        should "define AttachmentFu instance methods" do
          instance_modules = klass.included_modules
          assert instance_modules.include?(Technoweenie::AttachmentFu::InstanceMethods),
                                            "#{klass} doesn't define AttachmentFu instance methods"
        end
      end
    end
  end
end
