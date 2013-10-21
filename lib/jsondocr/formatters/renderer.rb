module JSONdocr::Formatters
  module Renderer
    def render(element, name)
      tpl_name = "#{element.element_type}/#{name}"
      format = self.class.to_s.split("::").last.downcase.to_sym

      tpl = File.read(File.expand_path(File.dirname(__FILE__)) + "/#{format}/#{tpl_name}.hbs")

      attrs = { element: element }

      # use corresponding presenter if available
      begin
        presenter_class = Kernel.const_get("::JSONdocr::Presenters::#{element.element_type.to_s.camelize}::#{name.to_s.camelize}")
        presenter_attrs = presenter_class.prepare(element)
        attrs.merge! presenter_attrs
      rescue NameError
      end

      render_template tpl, attrs
    end
  end
end

class String
  def camelize
    self.split("_").collect(&:capitalize).join("")
  end
end
