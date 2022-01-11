# frozen_string_literal: true

namespace :data do
  desc "Run data migration scripts. Provide VERSION env to run specific one"
  task migrate: :environment do
    require "simple_data_migrations"

    SimpleDataMigrations.run
  end

  task migrate_with_lock: :environment do
    require "simple_data_migrations"

    SimpleDataMigrations.run_with_lock
  end

  namespace :migrate do
    desc "Display status of data migration scripts"
    task status: :environment do
      require "simple_data_migrations"

      SimpleDataMigrations.status
    end
  end
end
