require 'dm-migrations/migration_runner'

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.logger.debug( "Starting Migration" )

require_relative '../config/app'

migration 1, :create_customers_table do
  up do
    create_table :customers do
      column :id,   Integer, :serial => true
      column :name, String
      column :email, String
    end
  end
  down do
    drop_table :customers
  end
end

migration 2, :create_orders_table do
  up do
    create_table :orders do
      column :id, Integer, :serial => true
      column :description, String
      column :amount, Integer
      column :status, String
      column :customer_id, Integer
    end
  end
  down do
    drop_table :orders
  end
end
