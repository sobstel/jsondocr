module JSONdocr
  module Builders
    class Doc
      include Behaviors::Dsl

      dsl_attr :name
      dsl_attr :desc

      dsl_elements :object
    end
  end
end