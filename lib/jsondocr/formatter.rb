require "tilt"

module JSONdocr
  class Formatter
    def render_element(element, opts = {})
      opts[:as] ||= "default"

      # use corresponding presenter if available
      begin
        presenter = JSONdocr.const_get("Presenters::#{element.element_type.to_s.camelize}::#{opts[:as].to_s.camelize}")
        element = presenter.new(element)
      rescue NameError
      end

      render element, opts
    end

    def render_partial(element, opts = {})
      opts[:dir] ||= "shared"
      render element, opts
    end

    def render(element, opts = {})
      opts[:dir] ||= element.element_type
      opts[:as] ||= "default"
      opts[:ext] ||= "erb"
      tpl_path = File.expand_path(File.dirname(__FILE__)) + "/templates/#{opts[:dir]}/#{opts[:as]}.#{opts[:ext]}"

      vars = opts
      vars[:element] = element
      vars[element.element_type] = element

      render_template tpl_path, vars
    end

    def render_template(tpl_path, vars = {})
      template = ::Tilt.new(tpl_path, 1, trim: "-")
      template.render self, vars
    end

    def path(element)
      "/#{element.name}/"
    end
  end
end

class String
  def camelize
    self.split("_").collect(&:capitalize).join("")
  end
end
