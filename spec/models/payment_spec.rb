require 'spec_helper'

describe Payment do

  let(:payment) {
    create :payment,
      order: create(:order,
                customer: create(:customer))
  }

  it "can be created" do
    expect { payment }.to change(Payment, :count).by(1)
  end

  it "belongs to order" do
    payment.order.should be_a Order
  end

end
