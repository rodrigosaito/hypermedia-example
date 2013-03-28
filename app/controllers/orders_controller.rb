class HypermediaExample

  get "/orders/:id" do
    hal Order.get(params[:id].to_i)
  end

end

