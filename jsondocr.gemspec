Gem::Specification.new do |s|
  s.name = "jsondocr"
  s.version = "0.1"
  s.summary = "jsondocr"
  s.description = "DSL for documenting JSON schema"
  s.license = 'MIT'

  s.author = "Przemek Sobstel"
  s.email = "przemek@sobstel.org"
  s.homepage = "http://sobstel.org/"

  s.has_rdoc = false

  s.add_runtime_dependency "docile"
  s.add_runtime_dependency "tilt", "~>2.0.0.beta1"

  # BUG: should be add_development_dependency
  s.add_runtime_dependency "pry"
  s.add_runtime_dependency "pry-remote"
  s.add_runtime_dependency "pry-nav"
  s.add_runtime_dependency "awesome_print"
end