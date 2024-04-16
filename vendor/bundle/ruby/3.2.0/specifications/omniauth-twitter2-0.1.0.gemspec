# -*- encoding: utf-8 -*-
# stub: omniauth-twitter2 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-twitter2".freeze
  s.version = "0.1.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/unasuke/omniauth-twitter2", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/unasuke/omniauth-twitter2" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yusuke Nakamura".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-01-13"
  s.description = "Twitter OAuth2 strategy for OmniAuth. '2' means OAuth 2.0.".freeze
  s.email = ["yusuke1994525@gmail.com".freeze]
  s.homepage = "https://github.com/unasuke/omniauth-twitter2".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.4.22".freeze
  s.summary = "Twitter OAuth2 strategy for OmniAuth".freeze

  s.installed_by_version = "3.4.22".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<omniauth>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.0".freeze])
end
