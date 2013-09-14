module JSONdocr
  module Builders
    class Doc
      include Behaviors::Dsl
      dsl_element_class JSONdocr::Elements::Doc

      include Behaviors::Objects

      dsl_attr :name, :writer => true
      dsl_attr :desc, :writer => true
    end
  end
end