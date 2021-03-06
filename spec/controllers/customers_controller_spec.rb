require 'spec_helper'

describe "Customers Controller" do

  let!(:customers) do
    FactoryGirl.create_list(:customer, 25)
  end

  let(:customer) { customers.first }

  describe "GET /customers" do

    before { get "/customers" }

    let(:expected_json) do
      {
        _links: {
          self: { href: '/customers' },
          next_page: { href: '/customers?limit=10&offset=10' }
        },
        customers: Haler.decorate(customers.first(10), { customer: { only_key_fields: true } }).serialize
      }
    end

    it "returns a application/hal+json response" do
      last_response.content_type.should eq "application/hal+json"
    end

    it "returns a hal+json collection" do
      parsed_resp.should eq expected_json
    end

    context "when pagination parameters are passed" do

      before { get "/customers?limit=2&offset=2" }

      let(:expected_json) do
        {
          _links: {
            self: { href: '/customers' },
            next_page: { href: '/customers?limit=2&offset=4' }
          },
          customers: Haler.decorate(customers[2..3], { customer: { only_key_fields: true }}).serialize
        }
      end

      it "returns a hal+json collection" do
        parsed_resp.should eq expected_json
      end

    end

  end

  describe "POST /customers" do

    it "creates a new customer" do
      expect {
        post "/customers", attributes_for(:customer).to_json, "CONTEXT_TYPE" => "application/json"

        last_response.status.should eq 201
      }.to change(Customer, :count).by(1)
    end

  end

  describe "GET /customers/:id" do

    before { get "/customers/#{customer.id}" }

    let(:expected_hash) do
      Haler.decorate(customer).serialize
    end

    it "returns a customer as hal+json" do
      parsed_resp.should eq expected_hash
    end

  end

end
