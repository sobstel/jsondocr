module JSONdocr
  module Builders
    module Behaviors
      module Objects
        def self.included(base)
          base.dsl_attr :elements
        end

        def object(name, &block)
          @elements ||= {}
          @elements[name] ||= Object.new
          @elements[name].doc(&block)
        end
        alias_method :document, :object
      end
    end
  end
end