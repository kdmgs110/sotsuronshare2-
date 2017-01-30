# -*- encoding: utf-8 -*-
# stub: pdfjs_rails 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "pdfjs_rails"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["shyam"]
  s.date = "2013-09-08"
  s.description = "PDFjs viewer for rails application."
  s.email = ["shyammohankanojia@gmail.com"]
  s.homepage = "https://github.com/shyammohankanojia/pdfjs_rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "PDFjs viewer https://github.com/mozilla/pdf.js for rails application"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<thor>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<thor>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<thor>, [">= 0"])
  end
end
