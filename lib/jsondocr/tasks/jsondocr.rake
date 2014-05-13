
def arg(name)
  ENV[name]
end

desc "Preview doc"
task :preview do
  doc_arg = arg("doc")

  doc = Object.const_get(doc_arg)

  require "awesome_print"
  ap doc.build
end

desc "Format doc"
task :format do
  formatter_arg = arg("type")
  doc_arg = arg("doc")

  formatter = Object.const_get("JSONdocr::Formatters::#{formatter_arg.capitalize}").new
  doc = Object.const_get(doc_arg)

  p formatter.format(doc)
end
