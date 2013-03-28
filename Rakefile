namespace :db do
  task :migrate do
    require './db/migrations'

    migrate_up!
  end

  task :seed do
    require './config/app'
    require 'faker'

    Customer.all.destroy
    Order.all.destroy

    100.times do |count|
      orders = []
      rand(5).times do
        orders << Order.new(description: Faker::Company.name, amount: rand(100))
      end

      Customer.create(name: Faker::Name.name, email: Faker::Internet.email, orders: orders)
    end
  end
end

