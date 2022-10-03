# Simple Data Migrations

Inspired by [data-migrate](https://github.com/ilyakatz/data-migrate) but simplified.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "simple_data_migrations"
```

## Usage

Install by creating db migration file:

`bin/rails generate simple_data_migrations:install` and then run `bin/rails db:migrate`

Generate sample data migration file by `bin/rails generate simple_data_migrations:template migration-name`

Status can be displayed by `bin/rails data:migrate:status`
And executed by `bin/rails data:migrate`

### Locked Migrations

To ensure that migration script is run only once during deploy to multiple machines, one can use `bin/rails data:migrate_with_lock` task.
It will use database advisory lock, in similar manner to how the Rails database migrations are run.
In case of multiple concurrent task invocations, the first run will succeed but the others will raise `SimpleDataMigrations::ConcurrentRun::Error`.

## Development

TODO:
  * add configuration
  * add tests

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tiramizoo/simple_data_migrations.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
