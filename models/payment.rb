class Payment
  include DataMapper::Resource

  property :id, Serial
  property :amount, Integer
  property :date, Date
  property :status, String # TODO symbol?

  belongs_to :order

end
