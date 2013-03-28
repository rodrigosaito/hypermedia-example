class CustomerDecorator
  include Haler::Decorator

  field :name, key_field: true
  field :email

  embedded :orders

end
