begin
  require "pry"
  require "pry-remote"
  require "pry-nav"
rescue LoadError
end

module JSONdocr
end

require "jsondocr/element"
require "jsondocr/builders"
require "jsondocr/presenters"
require "jsondocr/formatters"
require "jsondocr/renderer"
