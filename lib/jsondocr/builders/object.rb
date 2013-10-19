module JSONdocr
  module Builders
    class Object
      include Behaviors::Dsl

      dsl_attr :term
      dsl_attr :desc

      dsl_elements :object
      dsl_elements :property
      dsl_elements :array

      include Behaviors::Validation
    end
  end
end