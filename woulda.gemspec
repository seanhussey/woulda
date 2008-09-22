Gem::Specification.new do |s|
  s.name = %q{woulda}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Hussey"]
  s.date = %q{2008-09-21}
  s.email = %q{sean@seanhussey.com}
  s.files = ["LICENSE", "Rakefile", "README", "shoulda_macros/should_act_as_paranoid.rb"]
  s.homepage = %q{http://github.com/seanhussey/woulda}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{woulda}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{woulda is a home for shoulda macros that don't belong in the main shoulda library}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<thoughtbot-shoulda>, [">= 2.0.0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 2.0.0"])
  end
end
