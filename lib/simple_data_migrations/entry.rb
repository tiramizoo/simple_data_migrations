# frozen_string_literal: true

require "active_record/base"

module SimpleDataMigrations
  class Entry < ActiveRecord::Base
    self.table_name = "data_migrations"
  end
end
