
def arg(name)
  ENV[name]
end

desc "Preview doc"
task :preview do
  doc_arg = arg("doc")

  doc = Object.const_get(doc_arg)

  require "pp"
  pp doc.build
end

desc "Format doc"
task :format do
  formatter_arg = arg("type")
  doc_arg = arg("doc")
  file_arg = arg("file")

  formatter = Object.const_get("JSONdocr::Formatters::#{formatter_arg.capitalize}").new
  doc = Object.const_get(doc_arg).build

  formatted_doc = formatter.format(doc)
  print "#{doc_arg} formatted to #{formatter_arg}\n"

  if file_arg
    File.write(file_arg, formatted_doc)
    print "saved to #{file_arg}\n"
  else
    print formatted_doc
  end
end
