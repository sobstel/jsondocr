version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.name = "jsondocr"
  s.version = version
  s.summary = "jsondocr"
  s.description = "DSL for documenting JSON schema"
  s.license = 'MIT'

  s.author = "Przemek Sobstel"
  s.email = "przemek@sobstel.org"
  s.homepage = "http://sobstel.org/"

  s.has_rdoc = false

  s.add_dependency "docile"

  s.add_development_dependency "pry"
  s.add_development_dependency "pry-remote"
  s.add_development_dependency "pry-nav"
end