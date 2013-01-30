require 'spec_helper'

describe Order do

  let(:order) {
    create :order,
      customer: create(:customer),
      payments: [ create(:payment) ]
  }

  it "can be created" do
    expect{
      order
    }.to change(Order, :count).by(1)
  end

  it "belongs to a Customer" do
    order.customer.should be_a Customer
  end

  it "has many payments" do
    order.payments.first.should be_a Payment
  end

end
