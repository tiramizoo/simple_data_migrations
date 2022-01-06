# frozen_string_literal: true

require "benchmark"
require "thor/shell/basic"

require_relative "simple_data_migrations/version"
require_relative "simple_data_migrations/entry"
require_relative "simple_data_migrations/utils"
require_relative "simple_data_migrations/railtie" if defined?(Rails::Railtie)

module SimpleDataMigrations
  def self.status
    ran_versions = Utils.ran_versions
    files = Utils.script_files
    all_versions = (ran_versions | files).map { |filename| Utils.version(filename) }

    result = all_versions.sort.map do |version|
      filename = files.find { |file| file.start_with?(version) }

      [ran_versions.include?(version) ? "up" : "down", version, Utils.humanize_filename(filename)]
    end

    result.prepend(["Status", "Version", "Name"])
    Thor::Shell::Basic.new.print_table(result)
  end

  def self.run
    ran_versions = Utils.ran_versions
    non_run_scripts = Utils.script_files.select do |filename|
      !ran_versions.include?(Utils.version(filename))
    end

    if ENV["VERSION"]
      non_run_scripts.select! { |filename| Utils.version(filename) == ENV["VERSION"] }
    end

    non_run_scripts.each do |filename|
      Thor::Shell::Basic.new.say("Running data migration: #{filename}")
      time = Benchmark.measure do
        load Utils.root.join(filename)
      end
      measure = "%.4fs" % time.real
      Thor::Shell::Basic.new.say("Finished in #{measure}")
    end
  end

  def self.bootstrap
    attributes = Utils.script_files.map { |filename| {version: Utils.version(filename)} }
    Entry.insert_all!(attributes)
  end
end
