require 'spec_helper'

describe Customer do

  let(:customer) { create :customer, orders: [ build(:order) ] }

  it "can be created" do
    expect {
      customer
    }.to change(Customer, :count).by(1)
  end

  it "has many orders" do
    customer.orders.first.should be_a Order
  end

end
