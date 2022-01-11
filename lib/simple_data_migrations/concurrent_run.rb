# frozen_string_literal: true

module SimpleDataMigrations
  module ConcurrentRun
    class Error < StandardError; end

    MIGRATOR_SALT = 3053462845
    private_constant :MIGRATOR_SALT

    def self.with_advisory_lock
      with_advisory_lock_connection do |connection|
        lock_id = MIGRATOR_SALT * Zlib.crc32(connection.current_database)

        got_lock = connection.get_advisory_lock(lock_id)
        raise Error unless got_lock

        yield
      ensure
        got_lock && connection.release_advisory_lock(lock_id)
      end
    end

    # Caused by multi db specific connection flow. More on https://github.com/rails/rails/pull/38235
    def self.with_advisory_lock_connection
      pool = ActiveRecord::ConnectionAdapters::ConnectionHandler.new.establish_connection(
        ActiveRecord::Base.connection_db_config
      )

      pool.with_connection { |connection| yield(connection) }
    end
    private_class_method :with_advisory_lock_connection
  end
end
