# frozen_string_literal: true

module SimpleDataMigrations
  class Railtie < ::Rails::Railtie

    rake_tasks do
      load File.expand_path("../tasks/data.rake", __dir__)
    end

    generators do
      require File.expand_path("../generators/simple_data_migrations/template_generator", __dir__)
      require File.expand_path("../generators/simple_data_migrations/install_generator", __dir__)
    end
  end
end
