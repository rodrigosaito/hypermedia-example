class HypermediaExample

  get "/customers" do
    options = {}.tap do |opt|
      opt[:limit] = params[:limit].to_i if params[:limit]
      opt[:offset] = params[:offset].to_i if params[:offset]
    end

    hal Customer, options
  end

  post "/customers" do
    params = JSON.parse request.body.read

    Customer.create(params)

    201
  end

  get "/customers/:id" do
    hal Customer.get(params[:id].to_i)
  end

end
