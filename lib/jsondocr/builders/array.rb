module JSONdocr::Builders
  class Array
    include Behaviors::Dsl
    include Behaviors::Validation

    dsl_attr :term
    dsl_attr :item
    dsl_attr :sample

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