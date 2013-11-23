require "docile"

module JSONdocr::Builders::Behaviors
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
      element = ::JSONdocr::Element.new(element_type)

      # rewrite vars from builder to target element class
      self.instance_variables.each do |var_name|
        val = resolve_value(self.instance_variable_get(var_name))
        element.instance_variable_set(var_name, val)
        element.define_singleton_method(var_name[1..-1]) do
          instance_variable_get(var_name)
        end
      end

      element
    end

    private
      def element_type
        @element_type ||= self.class.to_s.split("::").last.downcase.to_sym
      end

      def resolve_value(val)
        if val.respond_to? :build
          val.build
        elsif val.is_a? ::Hash
          Hash[val.collect { |k,v| [k, resolve_value(v)] }]
        elsif val.is_a? ::Array
          val.collect { |v| resolve_value(v) }
        else
          val
        end
      end

    module ClassMethods
      def dsl_attr(name, options = {})
        name = name.to_sym

        define_method(name) do |val|
          instance_variable_set("@#{name}", val);
        end
      end

      def dsl_elements(element_type)
        element_type = element_type.to_sym

        define_method(element_type) do |element_name, &block|
          @elements ||= {}
          unless @elements[element_name]
            @elements[element_name] = JSONdocr.const_get("Builders::#{element_type.to_s.capitalize}").new
            @elements[element_name].doc { name(element_name) }
          end
          @elements[element_name].doc(&block)
        end

        alias_method :document, :object if element_type == :object
        alias_method :field, :property if element_type == :property
      end
    end
  end
end