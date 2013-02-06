class HypermediaExample
  helpers Sinatra::Hal

  get "/customers" do
    hal Customer
  end

  get "/customers/:id" do
    hal Customer.get(params[:id])
  end

end
