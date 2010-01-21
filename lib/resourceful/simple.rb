
module Resourceful
  module Simple
    extend ActiveSupport::Concern

    module ClassMethods

      def get(url, options = {})
        response = request(:get, url, options)
        response.parsed_body
      end

      def request(method, url, options = {})
        url = (url.is_a?(Addressable::URI) ? url : Addressable::URI.parse(url))
        adapter.call(method, url, options)
      end

    end

  end
end
