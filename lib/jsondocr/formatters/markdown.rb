module JSONdocr::Formatters
  class Markdown
    def format(doc)
      out = "---\n"
      out += "title: #{doc.name}\n"
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
        out += "_under construction_\n"
        out += "\n"
      end

      out
    end
  end
end