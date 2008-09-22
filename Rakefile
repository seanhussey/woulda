require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name              = "woulda"
  s.version           = "0.1.0"
  s.summary           = "woulda is a home for shoulda macros that don't belong in the main shoulda library"
  s.homepage          = "http://github.com/seanhussey/woulda"
  s.rubyforge_project = "woulda"
 
  s.files       = FileList["[A-Z]*", "{shoulda_macros}/**/*"]
 
  # s.has_rdoc         = true
  # s.extra_rdoc_files = ["README.rdoc", "CONTRIBUTION_GUIDELINES.rdoc"]
  # s.rdoc_options     = ["--line-numbers", "--inline-source", "--main", "README.rdoc"]
 
  s.author  = "Sean Hussey"
  s.email   = "sean@seanhussey.com"
 
  s.add_dependency "thoughtbot-shoulda", ">= 2.0.0"
end

Rake::GemPackageTask.new spec do |pkg|
  pkg.need_tar = true
  pkg.need_zip = true
end

desc "Generate a gemspec file for GitHub"
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end