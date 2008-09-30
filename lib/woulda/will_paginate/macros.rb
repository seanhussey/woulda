module Woulda
  module WillPaginate
    module Macros
      def should_have_per_page(count)
        klass = self.name.gsub(/Test$/, '').constantize
        context "#{klass}" do
          should "respond to per_page" do
            assert klass.respond_to?(:per_page), "#{klass} does not respond to :per_page"
          end

          should "have #{count} per page" do
            assert_equal count, klass.per_page
          end
        end
      end
    end
  end
end