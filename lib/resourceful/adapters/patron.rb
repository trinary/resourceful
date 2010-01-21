require 'options'
require 'patron'
require 'active_support/core_ext/object/returning'

module Resourceful::Adapters
  module Patron

    def self.included(mod)
      mod.adapter = Adapter.new
    end

    class Adapter

      def initialize
        @sessions = {}
      end

      def call(method, url, options = {})
        @options = Options.for(options)

        resp = session(url.authority).request(method, url.omit(:scheme, :authority), options)

        Resourceful::Response.new(resp.body, resp.status, resp.headers)
      end

      protected

      def session(base_url)
        @sessions[base_url] ||= new_session(base_url)
      end

      def new_session(base_url)
        returning ::Patron::Session.new do |session|
          session.timeout = 30
          session.base_url = base_url
        end
      end

    end

  end
end
