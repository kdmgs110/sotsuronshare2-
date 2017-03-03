# -*- encoding: utf-8 -*-
# stub: momentjs-rails 2.17.1 ruby lib

Gem::Specification.new do |s|
  s.name = "momentjs-rails"
  s.version = "2.17.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Derek Prior"]
  s.date = "2017-01-15"
  s.description = "    Moment.js is a lightweight javascript date library for parsing, manipulating, and formatting dates.\n    This gem allows for its easy inclusion into the rails asset pipeline.\n"
  s.homepage = "https://github.com/derekprior/momentjs-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "The Moment.js JavaScript library ready to play with Rails."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1"])
      s.add_development_dependency(%q<rails>, ["~> 3.2.12"])
      s.add_development_dependency(%q<test-unit>, ["~> 3.0"])
    else
      s.add_dependency(%q<railties>, [">= 3.1"])
      s.add_dependency(%q<rails>, ["~> 3.2.12"])
      s.add_dependency(%q<test-unit>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1"])
    s.add_dependency(%q<rails>, ["~> 3.2.12"])
    s.add_dependency(%q<test-unit>, ["~> 3.0"])
  end
end
