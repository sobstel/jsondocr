module JSONdocr
  module Example
    def example
      return @example if @example

      if @elements
        return Hash[@elements.collect do |name, el|
          [name, el.example]
        end]
      end

      if array?
        return [item.example]
      end

      case type
      when :object_id
        SecureRandom.hex(12)
      when :int
        0
      else
        ""
      end
    end
  end
end
