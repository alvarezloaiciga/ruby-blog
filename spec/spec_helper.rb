require 'rubygems'
require 'machospec'
require_relative '../lib/blog/'
require_relative '../lib/post/'
require_relative '../lib/csv_interactor/'
require_relative '../lib/web/server'

def initialize_test_server
  @test_thread = Thread.new{
    Server.start
  }
end

def stop_test_server
  Server.stop
  Thread.kill(@test_thread)
end
