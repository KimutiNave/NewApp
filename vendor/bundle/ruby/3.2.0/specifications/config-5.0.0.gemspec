# -*- encoding: utf-8 -*-
# stub: config 5.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "config".freeze
  s.version = "5.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Kuczynski".freeze, "Fred Wu".freeze, "Jacques Crocker".freeze]
  s.date = "2023-10-18"
  s.description = "Easiest way to manage multi-environment settings in any ruby project or framework: Rails, Sinatra, Padrino and others".freeze
  s.email = ["piotr.kuczynski@gmail.com".freeze, "ifredwu@gmail.com".freeze, "railsjedi@gmail.com".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "CHANGELOG.md".freeze, "CONTRIBUTING.md".freeze, "LICENSE.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "CONTRIBUTING.md".freeze, "LICENSE.md".freeze, "README.md".freeze]
  s.homepage = "https://github.com/rubyconfig/config".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "\n\e[33mThanks for installing Config\e[0m\nPlease consider donating to our open collective to help us maintain this project.\n\n\nDonate: \e[34mhttps://opencollective.com/rubyconfig/donate\e[0m\n".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.4.22".freeze
  s.summary = "Effortless multi-environment settings in Rails, Sinatra, Padrino and others".freeze

  s.installed_by_version = "3.4.22".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<deep_merge>.freeze, ["~> 1.2".freeze, ">= 1.2.1".freeze])
  s.add_runtime_dependency(%q<dry-validation>.freeze, ["~> 1.0".freeze, ">= 1.0.0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 12.0".freeze, ">= 12.0.0".freeze])
  s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.5".freeze, ">= 2.5.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.9".freeze, ">= 3.9.0".freeze])
  s.add_development_dependency(%q<bootsnap>.freeze, [">= 1.16.0".freeze])
  s.add_development_dependency(%q<rails>.freeze, ["= 7.1.0".freeze])
  s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 6.0.3".freeze])
  s.add_development_dependency(%q<sprockets-rails>.freeze, ["~> 3.4.2".freeze])
  s.add_development_dependency(%q<psych>.freeze, [">= 4".freeze])
  s.add_development_dependency(%q<mdl>.freeze, ["~> 0.9".freeze, ">= 0.9.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.85.0".freeze])
end
