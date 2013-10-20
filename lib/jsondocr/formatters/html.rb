require "handlebars"

module JSONdocr::Formatters
  class Html
    def render(tpl_name, attrs)
      tpl_file = File.read(File.expand_path(File.dirname(__FILE__)) + "/html/#{tpl_name}.hbs")
      handlebars.compile(tpl_file).call(attrs)
    end

    private
      def handlebars
        return @handlebars if @handlebars

        @opts = {}
        @opts[:base_href] ||= "/"
        @opts[:object_path] ||= "objects/%{name}/"

        @handlebars = Handlebars::Context.new

        @handlebars.register_helper(:object_url) do |object, object_name|
          url = @opts[:base_href]
          url += sprintf(@opts[:object_path], { name: object_name})
        end

        @handlebars
      end
  end
end