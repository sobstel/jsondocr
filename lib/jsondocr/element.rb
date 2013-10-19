module JSONdocr
  class Element
    def initialize(element_type)
      @element_type = element_type
    end

    def element_type
      @element_type
    end

    def doc?
      @element_type == :doc
    end

    def object?
      @element_type == :object
    end

    def array?
      @element_type == :array
    end

    def property?
      @element_type == :property
    end
  end
end