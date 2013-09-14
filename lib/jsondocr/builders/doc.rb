module JSONdocr
  module Builders
    class Doc
      include Behaviors::Dsl

      dsl_element_class JSONdocr::Elements::Doc

      dsl_attr :name, :writer => true
      dsl_attr :desc, :writer => true

      dsl_elements :object
    end
  end
end