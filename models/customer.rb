class Customer
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String

  has n, :orders

end

