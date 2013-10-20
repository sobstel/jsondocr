module JSONdocr::Builders
  module Behaviors
    module Validation
      def self.included(base)
        base.dsl_attr :validations
      end

      # Adds validation rule
      def validates(*attrs)
        @validations ||= []
        @validations << attrs
        attrs
      end
    end
  end
end