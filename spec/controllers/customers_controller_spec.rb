require 'spec_helper'

describe "Orders Controller" do

  let!(:customer) { create :customer }

  describe "/customers" do

    before { get "/customers" }

    let(:expected_json) do
      {
        _links: {
          self: { href: '/customers' }
        },
        customers: [
          CustomerDecorator.new(customer).serialize
        ]
      }.to_json
    end

    it "returns a application/hal+json response" do
      last_response.content_type.should eq "application/hal+json"
    end

    it "returns a hal+json collection" do
      last_response.body.should eq expected_json
    end

  end

  describe "/customers/:id" do

    before { get "/customers/#{customer.id}" }

    let(:expected_json) do
      CustomerDecorator.new(customer).serialize.to_json
    end

    it "returns a customer as hal+json" do
      last_response.body.should eq expected_json
    end

  end

end
