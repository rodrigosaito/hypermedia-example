APP_ENV = ENV['RACK_ENV'] ||= :development unless defined?(APP_ENV)

module HypermediaExample

  def self.env
    APP_ENV
  end

  def self.root
    File.expand_path(File.dirname(__FILE__) + "/../")
  end

end

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, APP_ENV)

# Config database
#DataMapper.logger = logger
DataMapper::Property::String.length(255)

# TODO externalize this config
case APP_ENV
  when :development then DataMapper.setup(:default, "sqlite3://" + File.join(HypermediaExample.root, 'db', "test_development.db"))
  when :production  then DataMapper.setup(:default, "sqlite3://" + File.join(HypermediaExample.root, 'db', "test_production.db"))
  when :test        then DataMapper.setup(:default, "sqlite3://" + File.join(HypermediaExample.root, 'db', "test_test.db"))
end

# Autoload all models
Dir[File.expand_path(File.dirname(__FILE__) + "/../models/*.rb")].each {|file| require file }

DataMapper.finalize

