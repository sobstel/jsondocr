module JSONdocr
  module Builders
    class Array
      include Behaviors::Dsl

      dsl_attr :term, :writer => true
      dsl_attr :item, :writer => true

      def object(&block)
        Object.new.doc(&block)
      end
      alias_method :document, :object

      def property(&block)
        Property.new.doc(&block)
      end
      alias_method :field, :property

      def array(&block)
        Array.new.doc(&block)
      end

      include Behaviors::Validation
    end
  end
end