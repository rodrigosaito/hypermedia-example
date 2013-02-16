APP_ENV = ENV['RACK_ENV'] ||= :development unless defined?(APP_ENV)

database_config = {
  development: "postgres://localhost/hypermedia-example_development",
  test: "sqlite3://" + File.join(HypermediaExample.root, 'db', 'hypermedia-example_test.db'),
  production: ''
}

DataMapper.setup(:default, database_config[APP_ENV.to_sym])