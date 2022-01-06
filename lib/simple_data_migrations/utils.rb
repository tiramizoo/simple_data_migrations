# frozen_string_literal: true

module SimpleDataMigrations
  module Utils
    def self.script_files
      Dir.children(root).sort
    end

    def self.ran_versions
      Entry.pluck(:version)
    end

    def self.root
      Rails.root.join("db/data")
    end

    def self.version(filename)
      filename.split("_", 2).first
    end

    def self.humanize_filename(filename)
      return "********** NO FILE **********" unless filename

      filename.delete_prefix(version(filename)).delete_suffix(".rb").humanize
    end
  end
end
