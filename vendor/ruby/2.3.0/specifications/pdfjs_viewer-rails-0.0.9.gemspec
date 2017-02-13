# -*- encoding: utf-8 -*-
# stub: pdfjs_viewer-rails 0.0.9 ruby lib

Gem::Specification.new do |s|
  s.name = "pdfjs_viewer-rails"
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Yves Senn"]
  s.date = "2016-07-28"
  s.description = "Packages the viewer distributed with PDF.js and makes it available in two styles (full, minimal)."
  s.email = ["yves.senn@gmail.com"]
  s.homepage = "https://github.com/senny/pdfjs_viewer-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "PDF.js viewer packaged as a Rails engine."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["> 4.2.0"])
      s.add_runtime_dependency(%q<sass-rails>, ["~> 5.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["> 4.2.0"])
      s.add_dependency(%q<sass-rails>, ["~> 5.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["> 4.2.0"])
    s.add_dependency(%q<sass-rails>, ["~> 5.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
