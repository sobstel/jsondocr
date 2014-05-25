module JSONdocr::Formatters
  class Markdown
    def format(doc)
      out = "---\n"
      out += "title: #{doc.name}\n"
      out += "\n"
      out += "search: true\n"
      out += "---\n"
      out += "\n"

      out += "\# Introduction\n"
      out += "\n"
      out += "#{doc.desc}\n"
      out += "\n"

      doc.elements.each do |key, el|
        out += "\# #{el.term} (#{el.name})\n"
        out += "\n"
        out += "#{el.desc}\n"
        out += "\n"
        out += "\#\# Attributes\n"
        out += "\n"

        out += "Name | Term | Type | Description\n"
        out += "---- | ---- | ---- | -----------\n"

        el.elements.each do |key, subel|
          type = subel.type || subel.element_type
          out += "#{subel.name} | #{subel.term} | #{type} | #{subel.desc}\n"
        end if el.elements
      end

      out
    end
  end
end