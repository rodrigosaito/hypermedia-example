class Order
  include DataMapper::Resource

  property :id, Serial
  property :description, String
  property :amount, Integer

end
