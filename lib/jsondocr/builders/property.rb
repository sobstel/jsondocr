module JSONdocr
  module Builders
    class Property
      include Behaviors::Dsl
      include Behaviors::Validation

      dsl_attr :term
      dsl_attr :desc
      dsl_attr :type
      dsl_attr :sample
    end
  end
end