APP_ENV = 'test'

require File.expand_path(File.dirname(__FILE__) + "/../config/app")

require 'rack/test'
require 'database_cleaner'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.include FactoryGirl::Syntax::Methods
  config.include Rack::Test::Methods

  config.before :suite do
    DataMapper.auto_migrate! # TODO remove this
    FactoryGirl.find_definitions

    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def app
  #Sinatra::Application
  HypermediaExample
end

# Test Helper Classes
class Person

  attr_accessor :id, :name, :age

  def initialize
    @id = 1
    @name = "Some Name"
    @age = 20
  end

end

class PersonDecorator
  include Haler::Decorator

  field :name
  field :age

  link :self do
    "/person/1"
  end

end

