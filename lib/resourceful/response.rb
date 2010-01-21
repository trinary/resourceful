require 'rack/response'

class Resourceful::Response < Rack::Response

  def parsed_body
    Resourceful.handler.parse(@body)
  end

end
