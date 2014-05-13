require "bundler/setup"

module JSONdocr
end

require "jsondocr/element"
require "jsondocr/builders"
require "jsondocr/formatters"

if defined?(Rake)
  Rake.add_rakelib(File.expand_path("../jsondocr/tasks", __FILE__))
end
