require 'spec_helper'

describe Sinatra::Hal do

  def app
    Sinatra.new do
      helpers Sinatra::Hal

      get("/") do
        hal Person.new 
      end

      get("/people") do
        hal [ Person.new ]
      end
    end
  end

  def response_should_eq(expected)
    begin
      JSON.parse(last_response.body).should eq(expected)
    rescue JSON::ParserError
      fail "Invalid JSON response: #{last_response.body}"
    end
    last_response.content_type.should eq "application/hal+json"
  end

  describe "#hal" do

    describe "when is an object" do

      let(:expected_json) do
        {
          "name" => "Some Name",
          "age" => 20,
          "_links" => {
            "self" => {
              "href" => "/person/1"
            }
          }
        }
      end

      it "returns an application/hal+json response" do
        get "/"
        response_should_eq expected_json
      end

    end

    describe "when is object respond_to :each method" do

      let(:expected_json) do
        [
          {
            "name" => "Some Name",
            "age" => 20,
            "_links" => {
              "self" => {
                "href" => "/person/1"
              }
            }
          }
        ]
      end

      it "returns an array as application/hal+json response" do
        get "/people"
        response_should_eq expected_json
      end

    end

  end

end
