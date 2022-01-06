# frozen_string_literal: true

require "rails/generators"
require "rails/generators/active_record"

module SimpleDataMigrations
  class InstallGenerator < Rails::Generators::Base
    include ActiveRecord::Generators::Migration

    source_paths << File.expand_path("../templates", __FILE__)

    def create_migration_file
      migration_template "install.rb.erb", "db/migrate/create_simple_data_migrations_table.rb"
    end

    private

    def migration_version
      "[#{ActiveRecord::VERSION::STRING.to_f}]"
    end
  end
end
