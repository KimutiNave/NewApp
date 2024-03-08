# -*- encoding: utf-8 -*-
# stub: planetscale_rails 0.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "planetscale_rails".freeze
  s.version = "0.2.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "homepage_uri" => "https://github.com/planetscale/planetscale_rails", "source_code_uri" => "https://github.com/planetscale/planetscale_rails" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mike Coutermarsh".freeze, "Iheanyi Ekechukwu".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-01-22"
  s.description = "A collection of rake tasks to make managing schema migrations with PlanetScale easy".freeze
  s.email = ["coutermarsh.mike@gmail.com".freeze, "iekechukwu@gmail.com".freeze]
  s.homepage = "https://github.com/planetscale/planetscale_rails".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.4.22".freeze
  s.summary = "Make Rails migrations easy with PlanetScale".freeze

  s.installed_by_version = "3.4.22".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<colorize>.freeze, ["~> 0.8.1".freeze])
  s.add_runtime_dependency(%q<rails>.freeze, [">= 6.0".freeze, "< 8".freeze])
end
