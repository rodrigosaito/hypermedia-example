class CustomerDecorator
  include Haler::Decorator

  field :name
  field :email

  embedded :orders

end
