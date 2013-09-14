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

          element = self.class.dsl_element_class.new

          self.instance_variables.each do |var_name|
            val = build_resolver.call(self.instance_variable_get(var_name))
            element.instance_variable_set(var_name, val)
          end

          element
        end

        module ClassMethods
          def dsl_element_class(element_class = nil)
            @element_class = element_class if element_class
            @element_class
          end

          def dsl_attr(name, options = {})
            name = name.to_sym

            if options[:writer] # default writer: def name; @name = val; end
              define_method(name) do |val|
                instance_variable_set("@#{name}", val);
              end
            end

            dsl_element_class.class_exec do
              attr_reader name
            end
          end
        end
      end
    end
  end
end