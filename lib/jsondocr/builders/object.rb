module JSONdocr
  module Builders
    class Object
      include Behaviors::Dsl
      dsl_element_class JSONdocr::Elements::Object

      include Behaviors::Validation
      include Behaviors::Objects
      include Behaviors::Properties
      include Behaviors::Arrays

      dsl_attr :term, :writer => true
      dsl_attr :desc, :writer => true
    end
  end
end