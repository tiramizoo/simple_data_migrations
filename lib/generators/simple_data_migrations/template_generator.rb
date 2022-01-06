# frozen_string_literal: true

require_relative "../../simple_data_migrations/utils"

module SimpleDataMigrations
  class TemplateGenerator < Rails::Generators::NamedBase
    def create_template_file
      version = Time.now.utc.strftime("%Y%m%d%H%M%S") # Rails db migration like
      path = SimpleDataMigrations::Utils.root.join("#{version}_#{file_name}.rb")

      create_file path do
<<-TEMPLATE
ApplicationRecord.transaction do
  # Your code

  SimpleDataMigrations::Entry.create!(version: #{version})
end
TEMPLATE
      end
    end
  end
end
