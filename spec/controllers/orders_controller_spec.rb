require "spec_helper"

describe "Orders controller" do

  let(:order) { FactoryGirl.create :order, customer: FactoryGirl.build(:customer) }

  describe "GET /orders/:id" do

    before { get "/orders/#{order.id}" }

    let(:expected_hash) do
      Haler.decorate(order).serialize
    end

    it "returns an Order as hal+json"  do
      parsed_resp.should eq expected_hash
    end

  end

end

