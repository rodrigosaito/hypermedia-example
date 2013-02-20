require 'sinatra/base'

module Sinatra

  module Hal

    def hal(object, options ={})
      content_type "application/hal+json"

      decorator = Haler.decorate(object, options)
      decorator.to_json
    end

    def hal_links(&block)
      content_type "application/hal+json"

      if block_given?
        links = LinksBuilder.new.tap do |builder|
          builder.instance_eval(&block)
        end

        {
          _links: links.serialize
        }.to_json
      end
    end

    class LinksBuilder

      def initialize
        @links = {}
      end

      def link(name, href)
        @links[name] = { href: href }
      end

      def serialize
        @links
      end

    end

  end

end
