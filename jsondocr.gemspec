Gem::Specification.new do |s|
  s.name = "jsondocr"
  s.version = "0.0.2dev"
  s.summary = "jsondocr"
  s.description = "DSL for documenting JSON schema"
  s.license = 'MIT'

  s.author = "Przemek Sobstel"
  s.email = "przemek@sobstel.org"
  s.homepage = "http://sobstel.org/"

  s.has_rdoc = false

  s.add_dependency "docile"
  s.add_dependency "handlebars"

  s.add_dependency "pry"
  s.add_dependency "pry-remote"
  s.add_dependency "pry-nav"
end