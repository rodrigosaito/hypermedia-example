class Order
  include DataMapper::Resource

  property :id, Serial
  property :description, String
  property :amount, Integer
  property :status, String # TODO symbol?

  belongs_to :customer

  has n, :payments

end
