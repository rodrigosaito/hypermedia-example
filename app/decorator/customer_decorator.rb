class CustomerDecorator 
  include Haler::Decorator

  field :name

  link :self do
    "/customers/id"
  end

end
