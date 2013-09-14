require "docile"

begin
  require "pry"
  require "pry-remote"
  require "pry-nav"
rescue LoadError
end

require "jsondocr/elements/doc"
require "jsondocr/elements/object"
require "jsondocr/elements/property"
require "jsondocr/elements/array"

require "jsondocr/builders/behaviors/dsl"
require "jsondocr/builders/behaviors/validation"
require "jsondocr/builders/behaviors/objects"
require "jsondocr/builders/behaviors/properties"
require "jsondocr/builders/behaviors/arrays"

require "jsondocr/builders/doc"
require "jsondocr/builders/object"
require "jsondocr/builders/property"
require "jsondocr/builders/array"

module JSONdocr
end
