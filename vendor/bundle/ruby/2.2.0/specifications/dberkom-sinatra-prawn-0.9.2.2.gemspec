# -*- encoding: utf-8 -*-
# stub: dberkom-sinatra-prawn 0.9.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dberkom-sinatra-prawn"
  s.version = "0.9.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["S. Brent Faulkner", "Daniel Berkompas"]
  s.date = "2012-04-03"
  s.description = "Sinatra extension to add support for pdf rendering with Prawn templates."
  s.email = "brentf@unwwwired.net daniel@clearsightstudio.com"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/danielberkompas/sinatra-prawn"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.4.5"
  s.summary = "Sinatra extension to add support for pdf rendering with Prawn templates."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<prawn>, [">= 0"])
    else
      s.add_dependency(%q<prawn>, [">= 0"])
    end
  else
    s.add_dependency(%q<prawn>, [">= 0"])
  end
end
