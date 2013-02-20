class HypermediaExample
  helpers Sinatra::Hal

  get "/" do
    hal_links do
      link :self, "/"
      link :customers, "/customers"
    end
  end

end
