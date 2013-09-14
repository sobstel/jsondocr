module JSONdocr
  module Builders
    class Property
      include Behaviors::Dsl
      dsl_element_class JSONdocr::Elements::Property

      include Behaviors::Validation

      dsl_attr :term, :writer => true
      dsl_attr :desc, :writer => true
      dsl_attr :type, :writer => true
    end
  end
end