Gem::Specification.new do |s|
  s.name = "jsondocr"
  s.version = "0.2"
  s.summary = "jsondocr"
  s.description = "DSL for documenting JSON-like schema"
  s.license = "MIT"

  s.author = "Przemek Sobstel"
  s.email = "przemek@sobstel.org"
  s.homepage = "https://github.com/sobstel/jsondocr"

  s.has_rdoc = false

  s.add_runtime_dependency "docile"

  s.add_development_dependency "awesome_print"
end