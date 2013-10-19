module JSONdocr
  module Builders
    class Object
      include Behaviors::Dsl

      dsl_attr :term, :writer => true
      dsl_attr :desc, :writer => true

      dsl_elements :object
      dsl_elements :property
      dsl_elements :array

      include Behaviors::Validation
    end
  end
end