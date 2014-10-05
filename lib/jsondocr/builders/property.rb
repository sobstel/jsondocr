module JSONdocr::Builders
  class Property
    include Behaviors::Dsl
    include Behaviors::Validation
    include Behaviors::Example

    dsl_attr :name
    dsl_attr :term
    dsl_attr :desc
    dsl_attr :type
    dsl_attr :example
  end
end