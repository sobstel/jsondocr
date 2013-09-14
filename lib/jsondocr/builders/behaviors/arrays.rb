module JSONdocr
  module Builders
    module Behaviors
      module Arrays
        def self.included(base)
          base.dsl_attr :elements
        end

        def array(name, &block)
          @elements ||= {}
          @elements[name] ||= Array.new
          @elements[name].doc(&block)
        end
      end
    end
  end
end