
require 'sinatra'
require 'yajl'
require 'yajl/json_gem'

require 'stringio'
class StringIO
  def to_json
    string.to_json
  end
end

def any(*args, &blk)
  [:get, :post, :put, :delete].each do |meth|
    self.send(meth, *args, &blk)
  end
end

any '/' do
  content_type 'application/json', :charset => 'utf-8'
  { :hello => "World!"}.to_json
  #request.env.to_json
end

