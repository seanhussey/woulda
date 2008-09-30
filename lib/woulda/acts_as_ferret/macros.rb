module Woulda
  module ActsAsFerret
    module Macros
      # should_act_as_ferret :any, :fields, :i_may, :have, :specified
      # Original source: http://www.soyunperdedor.com/node/34
      def should_act_as_ferret(*fields)
        klass = self.name.gsub(/Test$/, '').constantize

        should "include ActsAsFerret methods" do
          assert klass.extended_by.include?(ActsAsFerret::ClassMethods)
          assert klass.include?(ActsAsFerret::InstanceMethods)
          assert klass.include?(ActsAsFerret::MoreLikeThis::InstanceMethods)
          assert klass.include?(ActsAsFerret::ResultAttributes)
        end

        fields.each do |f|
          should "create an index for field named #{f}" do
            assert klass.aaf_configuration[:fields].include?(f)
          end
        end
      end
    end
  end
end