# frozen_string_literal: true

require_relative "lib/simple_data_migrations/version"

Gem::Specification.new do |spec|
  spec.name = "simple_data_migrations"
  spec.version = SimpleDataMigrations::VERSION
  spec.authors = ["Wojciech Wnętrzak"]
  spec.email = ["w.wnetrzak@gmail.com"]

  spec.summary = "Data migrations"
  spec.description = "Data migrations (mainly for Rails)"
  spec.homepage = "https://github.com/tiramizoo/simple_data_migrations"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tiramizoo/simple_data_migrations"
  spec.metadata["changelog_uri"] = "https://github.com/tiramizoo/simple_data_migrations/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 6.0"
  spec.add_dependency "thor", ">= 1.0"
end
