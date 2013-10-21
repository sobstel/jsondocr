require "handlebars"

module JSONdocr::Formatters
  class Html
    include Renderer

    def render_template(tpl, attrs)
      handlebars.compile(tpl).call(attrs)
    end

    private
      def handlebars
        return @handlebars if @handlebars

        @opts = {}
        @opts[:base_href] ||= "/"
        @opts[:object_path] ||= "objects/%{name}/"

        @handlebars = Handlebars::Context.new

        @handlebars.register_helper(:render) do |element, name|
          render element, name
        end

        @handlebars.register_helper(:object_url) do |object, object_name|
          url = @opts[:base_href]
          url += sprintf(@opts[:object_path], { name: object_name})
        end

        @handlebars
      end
  end
end