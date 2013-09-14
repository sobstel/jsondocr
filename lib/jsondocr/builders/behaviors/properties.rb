module JSONdocr
  module Builders
    module Behaviors
      module Properties
        def self.included(base)
          base.dsl_attr :elements
        end

        def property(name, &block)
          @elements ||= {}
          @elements[name] ||= Property.new
          @elements[name].doc(&block)
        end
        alias_method :field, :property
      end
    end
  end
end