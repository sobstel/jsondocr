module JSONdocr::Builders
  class Array
    include Behaviors::Dsl
    include Behaviors::Validation
    include Behaviors::Example

    dsl_attr :name
    dsl_attr :term
    dsl_attr :desc
    dsl_attr :item
    dsl_attr :example

    def item(element, &block)
      @item = element.doc(&block).build
    end

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