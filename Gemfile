source :rubygems

gem 'sinatra', require: false
gem 'sinatra-contrib'
gem 'data_mapper'

gem 'json'
# TODO change to real version
gem 'haler', git: 'https://github.com/rodrigosaito/haler.git'

group :development, :test do
  gem 'dm-sqlite-adapter'
end

group :test do
  gem 'rspec'
  gem 'guard-rspec'
  gem 'factory_girl', '~> 4.0'
  gem 'rack-test'
  gem 'database_cleaner'
end
