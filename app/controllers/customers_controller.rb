class HypermediaExample
  helpers Sinatra::Hal

  get "/customers" do
    options = {}.tap do |opt|
      opt[:limit] = params[:limit].to_i if params[:limit]
      opt[:offset] = params[:offset].to_i if params[:offset]
    end

    hal Customer, options
  end

  get "/customers/:id" do
    hal Customer.get(params[:id])
  end

end
