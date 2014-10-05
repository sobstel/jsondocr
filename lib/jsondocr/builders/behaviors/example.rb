module JSONdocr::Builders::Behaviors
  module Example
    def oid
      SecureRandom.hex(12)
    end
  end
end