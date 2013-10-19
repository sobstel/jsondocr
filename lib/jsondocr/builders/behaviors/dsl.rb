module JSONdocr
  module Builders
    module Behaviors
      module Dsl
        def self.included(base)
          base.extend ClassMethods
        end

        def doc(&block)
          ::Docile.dsl_eval(self, &block) if block_given?
          self
        end
        alias_method :dsl_eval, :doc

        def build
          build_resolver = ->(val) do
            if val.respond_to? :build
              val.build
            elsif val.is_a? ::Hash
              Hash[val.collect { |k,v| [k, build_resolver.call(v)] }]
            elsif val.is_a? ::Array
              val.collect { |v| build_resolver.call(v) }
            else
              val
            end
          end

          element = ::JSONdocr::Element.new(self.class.to_s.split("::").last.downcase.to_sym)

          # rewrite vars from builder to target element class
          self.instance_variables.each do |var_name|
            val = build_resolver.call(self.instance_variable_get(var_name))
            element.instance_variable_set(var_name, val)
            element.define_singleton_method(var_name[1..-1]) do
              instance_variable_get(var_name)
            end
          end

          element
        end

        module ClassMethods
          def dsl_attr(name, options = {})
            name = name.to_sym

            define_method(name) do |val|
              instance_variable_set("@#{name}", val);
            end
          end

          def dsl_elements(element_name)
            element_name = element_name.to_sym

            define_method(element_name) do |name, &block|
              @elements ||= {}
              @elements[name] ||= Kernel.const_get("::JSONdocr::Builders::#{element_name.to_s.capitalize}").new
              @elements[name].doc(&block)
            end

            alias_method :document, :object if element_name == :object
            alias_method :field, :property if element_name == :property
          end
        end
      end
    end
  end
end