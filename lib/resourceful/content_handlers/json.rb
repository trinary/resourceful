require 'yajl'

module Resourceful::ContentHandlers
  module JSON

    def self.included(resourceful)
      resourceful.register_handler(:json, "application/json", JsonParser.new)
    end

    class JsonParser

      def initialize
        @parser = ::Yajl::Parser.new
      end

      def parse(http_body)
        @parser.parse(http_body.first)
      end

    end

  end
end
