namespace :db do
  task :migrate do
    require './db/migrations'

    migrate_up!
  end

  task :seed do
    require './config/app'
    require 'faker'

    Customer.all.destroy

    100.times do |count|
      Customer.create(name: Faker::Name.name, email: Faker::Internet.email)
    end
  end
end
