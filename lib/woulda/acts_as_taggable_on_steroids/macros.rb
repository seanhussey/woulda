module Woulda
  module ActsAsTaggableOnSteroids
    module Macros
      # Original source: http://www.soyunperdedor.com/node/34
      def should_act_as_taggable_on_steroids
        klass = self.name.gsub(/Test$/, '').constantize

        should "include ActsAsTaggableOnSteroids methods" do
          assert klass.extended_by.include?(ActiveRecord::Acts::Taggable::ClassMethods)
          assert klass.extended_by.include?(ActiveRecord::Acts::Taggable::SingletonMethods)
          assert klass.include?(ActiveRecord::Acts::Taggable::InstanceMethods)
        end

        should_have_many :taggings, :tags
      end
    end
  end
end