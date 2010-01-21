require 'active_support/concern'
require 'addressable/uri'
require 'options'

$LOAD_PATH << File.dirname(__FILE__)

module Resourceful
  #extend ActiveSupport::Concern

  module ClassMethods

    def setup(&blk)
      instance_eval(&blk)
    end

    def defaults!
      include Resourceful::Simple
      include Resourceful::Adapters::Patron
      include Resourceful::ContentHandlers::JSON
    end

    def adapter
      raise "Please set up an adapter first!" unless @adapter
      @adapter
    end

    def adapter=(adapter)
      @adapter = adapter
    end

    def register_handler(name, mime_type, handler)
      @handler = handler
    end

    def handler
      @handler
    end

  end

  extend ClassMethods

  autoload :Simple, 'resourceful/simple'

  autoload :Response, 'resourceful/response'

  module Adapters
    autoload :Patron, 'resourceful/adapters/patron'
  end

  module ContentHandlers
    autoload :JSON, 'resourceful/content_handlers/json'
  end

end


