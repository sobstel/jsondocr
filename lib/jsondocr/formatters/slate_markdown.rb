require "json"

module JSONdocr::Formatters
  # Markdown tailor-made for tripit/slate (https://github.com/tripit/slate)
  # It's implemented quick and dirty way. I know.
  class SlateMarkdown
    def format(doc)
      out = "---\n"
      out += "title: #{doc.name}\n"
      out += "\n"
      out += "search: true\n"
      out += "---\n"
      out += "\n"

      out += "\# #{doc.name}\n"
      out += "\n"
      out += "#{doc.desc}\n"
      out += "\n"

      doc.elements.each_value do |el|
        out += "\#\# #{el.term} (#{el.name})\n\n"

        json_example = JSON.pretty_generate(el.example)
        out += "```json\n#{json_example}\n```\n\n"

        if el.desc
          out += "#{el.desc}\n\n"
        end

        out += format_elements(el.elements)
      end

      out
    end

    private
      def format_elements(elements)
        return "" unless elements

        out = "<table>\n"

        elements.each_value do |subel|
          out += format_element(subel)
        end

        out += "</table>\n"

        out
      end

      def format_element(element)
        out = ""

        type = element.type || element.element_type
        type_s = type.to_s
        type_s += " [#{element.item.type || element.item.element_type}]" if (type == :array)

        name_s = element.name.to_s

        out += "<tr class=\"attr\"><td><strong>#{name_s}</strong></td><td><strong>#{element.term}</strong></td><td><em>#{type_s}</em></td></tr>\n"
        out += "<tr><td colspan=\"2\"></td><td>#{element.desc}</td></tr>\n" if element.desc

        if element.validations
          out += "<tr><td colspan=\"2\"></td><td>Constraints:<ul>"
          element.validations.each do |validation|
            name, values = validation.first
            out += "<li>#{name}"
            if values
              out += " - "
              values.each_with_index do |(key, val), index|
                out += "#{key}: #{val}"
                out += ", " if (values.length - 1 != index)
              end
            end
            out += "</li>"
          end
          out += "</ul></td></tr>"
        end

        if element.object?
          out += "<tr><td colspan=\"2\"></td><td>\n"
          out += format_elements(element.elements)
          out += "</td></tr>\n"
        end

        if element.array? && element.item.object?
          out += "<tr><td colspan=\"2\"></td><td>\n"
          out += format_elements(element.item.elements)
          out += "</td></tr>\n"
        end

        out
      end
  end
end