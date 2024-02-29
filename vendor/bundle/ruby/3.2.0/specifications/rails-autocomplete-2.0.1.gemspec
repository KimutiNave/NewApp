# -*- encoding: utf-8 -*-
# stub: rails-autocomplete 2.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-autocomplete".freeze
  s.version = "2.0.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Padilla".freeze, "Joiey Seeley".freeze, "Sundus Yousuf".freeze, "XPeppers".freeze]
  s.date = "2017-08-03"
  s.description = "Use jQuery's autocomplete plugin with Rails 4+.".freeze
  s.email = "david@padilla.cc joiey.seeley@gmail.com sundusahmedyousuf@gmail.com orione-team@xpeppers.com".freeze
  s.homepage = "https://github.com/xpeppers/rails-autocomplete/".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.22".freeze
  s.summary = "Use jQuery's autocomplete plugin with Rails 4+.".freeze

  s.installed_by_version = "3.4.22".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rails>.freeze, [">= 4.0".freeze])
  s.add_development_dependency(%q<sqlite3-ruby>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<bson_ext>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<test-unit>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<shoulda>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<uglifier>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rr>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simple_form>.freeze, [">= 0".freeze])
end
