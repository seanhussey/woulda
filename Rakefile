require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "woulda"
    s.summary = "woulda is a home for shoulda macros that don't belong in the main shoulda library"
    s.email = ["sean@seanhussey.com", "josh@technicalpickles.com"]
    s.homepage = "http://github.com/seanhussey/woulda"
    s.description = "TODO"
    s.authors = ["Sean Hussey", "Josh Nichols"]
    s.add_dependency "thoughtbot-shoulda", ">= 2.0.0"
    s.rubyforge_project = "woulda"
    s.files       = FileList["[A-Z]*", "{shoulda_macros}/**/*", "lib/**/*"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc "Run all tests"
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

task :default => :test
