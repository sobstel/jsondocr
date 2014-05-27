require 'fileutils'

SLATE_DIR = "tmp/slate"
SLATE_SOURCE_DIR = "doc/slate-source"

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
  doc_arg = arg("doc")
  formatter_arg = arg("type") || "markdown"
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

desc "Slate - setup original tripit/slate repo"
task :slate_tripit do
  mkdir_p SLATE_DIR

  cd SLATE_DIR do
    unless Dir.exists? "original"
      sh "git clone https://github.com/tripit/slate.git original"
    end

    cd "original" do
      sh "git checkout master"
      sh "git pull"
    end
  end
end

desc "Slate - merge slate custom files with original tripit version"
task :slate_merge do
  mkdir_p SLATE_DIR

  cd SLATE_DIR do
    rm_rf "local"
    cp_r "original", "local", :preserve => true
    # rm_rf "local/.git"
  end

  Dir["#{SLATE_SOURCE_DIR}/**/*.*"].sort.each do |file|
    basename = file[(SLATE_SOURCE_DIR.length+1)..-1]

    cp_r file, "#{SLATE_DIR}/local/source/#{basename}", :preserve => true

    # TODO: merge
    # => .prepend
    # => .append
  end
end

task :slate_generate do
  ENV["type"] = "markdown"
  ENV["file"] = "#{SLATE_DIR}/local/source/index.md"
  Rake::Task["format"].invoke
end

desc "Build docs website (using tripit/slate)"
task :slate => [:slate_tripit, :slate_merge, :slate_generate] do
  fork do
    Dir.chdir("#{SLATE_DIR}/local") do
      ENV['BUNDLE_GEMFILE'] = "Gemfile"
      Bundler.setup
      sh 'bundle exec middleman build --clean'
      ln_s 'build', 'public' # for .pow
    end
  end && Process.wait
end

#TODO task :publish

