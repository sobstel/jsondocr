module JSONdocr
  module Builders
    class Property
      include Behaviors::Dsl

      dsl_attr :term, :writer => true
      dsl_attr :desc, :writer => true
      dsl_attr :type, :writer => true

      include Behaviors::Validation
    end
  end
end