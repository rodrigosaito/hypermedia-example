require "spec_helper"

describe "Root Controller" do

  describe "GET /" do

    let(:expected_response_body) do
      {
        _links: {
          self: { href: "/" },
          customers: { href: "/customers" }
        }
      }
    end

    def parsed_response
      JSON.parse(last_response.body, symbolize_names: true)
    end

    before do
      get "/"
    end

    it "returns a hal+json" do
      last_response.content_type.should eq "application/hal+json"
    end

    it "returns a hal+json with links" do
      parsed_response.should eq expected_response_body
    end

  end

end
