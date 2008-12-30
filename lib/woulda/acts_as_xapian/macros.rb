module Woulda
  module ActsAsXapian
    module Macros
      
      #
      # should_act_as_xapian :name, :description
      #
      def should_act_as_xapian(*fields)
        klass = model_class

        context "A #{klass}" do
          should "include ActsAsXapian methods" do
            assert klass.include?(ActsAsXapian::InstanceMethods)
          end  

          fields.each do |field|
            should "index field #{field}" do
              assert klass.xapian_options[:texts].include?(field)
            end
          end
        end

      end
      
    end    
  end  
end