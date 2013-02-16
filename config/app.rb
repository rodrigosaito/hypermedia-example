APP_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(APP_ENV)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, APP_ENV)

# Autload lib
Dir[File.expand_path(File.dirname(__FILE__) + "/../lib/*/*.rb")].each {|file| require file }

require 'sinatra/base'
require 'sinatra/reloader'

class HypermediaExample < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  def self.env
    APP_ENV
  end

  def self.root
    File.expand_path(File.dirname(__FILE__) + "/../")
  end

  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

end

# Config database
DataMapper.logger = HypermediaExample.logger
DataMapper::Property::String.length(255)

database_config = {
  'development' => "postgres://localhost/hypermedia-example_development",
  'test' => "sqlite3://" + File.join(HypermediaExample.root, 'db', 'hypermedia-example_test.db'),
  'production' => ENV['DATABASE_URL']
}

DataMapper.setup(:default, database_config[APP_ENV])

# Autoload all models
Dir[File.expand_path(File.dirname(__FILE__) + "/../models/*.rb")].each {|file| require file }
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/*/*.rb")].each {|file| require file }

DataMapper.finalize
