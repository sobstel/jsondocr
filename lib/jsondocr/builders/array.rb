module JSONdocr
  module Builders
    class Array
      include Behaviors::Dsl
      dsl_element_class JSONdocr::Elements::Array

      include Behaviors::Validation

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
    end
  end
end