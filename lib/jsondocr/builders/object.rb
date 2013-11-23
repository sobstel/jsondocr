module JSONdocr::Builders
  class Object
    include Behaviors::Dsl
    include Behaviors::Validation

    dsl_elements :object
    dsl_elements :property
    dsl_elements :array

    dsl_attr :name
    dsl_attr :term
    dsl_attr :desc
  end
end