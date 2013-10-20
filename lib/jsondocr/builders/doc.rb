module JSONdocr::Builders
  class Doc
    include Behaviors::Dsl

    dsl_elements :object

    dsl_attr :name
    dsl_attr :desc
  end
end