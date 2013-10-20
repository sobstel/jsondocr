module JSONdocr
  class Renderer
    def initialize(formatter)
      @formatter = formatter
    end

    def render(element, name)
      tpl_name = "#{element.element_type}/#{name}"

      attrs = {}
      attrs[:element] = element

      # TODO if there's presenter, use it automatically!

      @formatter.render(tpl_name, attrs)
    end
  end
end