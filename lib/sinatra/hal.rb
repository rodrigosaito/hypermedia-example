require 'sinatra/base'

module Sinatra

  module Hal

    def hal(object, options ={})
      content_type "application/hal+json"

      decorator = Haler.decorate(object, options)
      decorator.to_json
    end

  end

end
