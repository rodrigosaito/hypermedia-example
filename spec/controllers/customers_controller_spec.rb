require 'spec_helper'

describe "Customers Controller" do

  let!(:customers) do
    FactoryGirl.create_list(:customer, 25)
  end

  let(:customer) { customers.first }

  def parsed_resp
    JSON.parse(last_response.body, symbolize_names: true)
  end

  describe "/customers" do

    before { get "/customers" }

    let(:expected_json) do
      {
        _links: {
          self: { href: '/customers' },
          next_page: { href: '/customers?limit=10&offset=10' }
        },
        customers: Haler.decorate(customers.first(10)).serialize
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
          customers: Haler.decorate(customers[2..3]).serialize
        }
      end

      it "returns a hal+json collection" do
        parsed_resp.should eq expected_json
      end

    end

  end

  describe "/customers/:id" do

    before { get "/customers/#{customer.id}" }

    let(:expected_json) do
      Haler.decorate(customer).to_json
    end

    it "returns a customer as hal+json" do
      last_response.body.should eq expected_json
    end

  end

end
