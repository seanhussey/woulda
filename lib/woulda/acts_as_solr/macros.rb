module Woulda
  module ActsAsSolr
    module Macros
      def should_act_as_solr(opts={})
        klass = model_class
        
        associations = get_options!([opts], :associations)

        associations ||= []

        context "A #{klass.name}" do
          # should "include the ActsAsSolr::ParserMethods module" do
          #   assert klass.included_modules.include?(ActsAsSolr::ParserMethods)
          # end
          # 
          # should "include the ActsAsSolr::CommonMethods module" do
          #   assert klass.included_modules.include?(ActsAsSolr::CommonMethods)
          # end
          # 
          # should "include the ActsAsSolr::InstanceMethods module" do
          #   assert klass.included_modules.include?(ActsAsSolr::InstanceMethods)
          # end
          # 
          # should "be extended by the ActsAsSolr::ClassMethods module" do
          #   assert klass.extended_by.include?(ActsAsSolr::ClassMethods)
          # end
          # 
          # should "be extended by the ActsAsSolr::ParserMethods module" do
          #   assert klass.extended_by.include?(ActsAsSolr::ParserMethods)
          # end
          # 
          # should "be extended by the ActsAsSolr::CommonMethods module" do
          #   assert klass.extended_by.include?(ActsAsSolr::CommonMethods)
          # end
          # 
          # should "be extended by the ActsAsSolr::PaginationExtension module" do
          #   assert klass.extended_by.include?(ActsAsSolr::PaginationExtension)
          # end

          associations.each do |association|
            should "include the #{association.to_s} association in solr indexing" do
              klass.configuration[:include].include?(association)
            end
          end
        end
      end
    end
  end
end
