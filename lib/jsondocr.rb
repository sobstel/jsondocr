require "docile"

begin
  require "pry"
  require "pry-remote"
  require "pry-nav"
rescue LoadError
end

require "jsondocr/element"

require "jsondocr/builders/behaviors/dsl"
require "jsondocr/builders/behaviors/validation"

require "jsondocr/builders/doc"
require "jsondocr/builders/object"
require "jsondocr/builders/property"
require "jsondocr/builders/array"

module JSONdocr
end
