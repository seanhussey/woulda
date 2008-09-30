module Woulda
  module ActsAsParanoid
    module Macros
      def self.should_act_as_solr(*included_associations)
        klass = model_class

        context "A #{klass.name}" do
          should "include the acts_as_solr modules" do
            assert klass.included_modules.include?(ActsAsSolr::ParserMethods)
            assert klass.included_modules.include?(ActsAsSolr::CommonMethods)
            assert klass.included_modules.include?(ActsAsSolr::InstanceMethods)
          end
          
          should "be extended by the acts_as_solr modules" do
            assert klass.extended_by.include?(ActsAsSolr::ClassMethods)
            assert klass.extended_by.include?(ActsAsSolr::ParserMethods)
            assert klass.extended_by.include?(ActsAsSolr::CommonMethods)
            assert klass.extended_by.include?(ActsAsSolr::PaginationExtension)
          end

          included_associations.each do |association|
            should "include the #{association.to_s} association in solr indexing" do
              klass.configuration[:include].include?(association)
            end
          end
        end
      end
    end
  end
end