module JSONdocr
  module Builders
    class Property
      include Behaviors::Dsl

      dsl_attr :term
      dsl_attr :desc
      dsl_attr :type
      dsl_attr :sample

      include Behaviors::Validation
    end
  end
end