module JSONdocr
  module Builders
    module Behaviors
    end
  end
end

require_relative "builders/behaviors/dsl"
require_relative "builders/behaviors/validation"
require_relative "builders/behaviors/example"

require_relative "builders/doc"
require_relative "builders/object"
require_relative "builders/property"
require_relative "builders/array"
