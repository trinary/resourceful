require 'rubygems'
require 'spec'
require 'pp'

__DIR__ = File.dirname(__FILE__)

$LOAD_PATH << File.join(__DIR__, "..", "lib")
require 'resourceful'

$LOAD_PATH << __DIR__ # ./spec

Resourceful.configure { defaults! }

TEST_SERVER = "http://localhost:4567"


