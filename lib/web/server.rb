require 'webrick'
require_relative 'blog/blog_servlet'
class Server
  include WEBrick

  def self.start
    @@s = HTTPServer.new(
      :Port => 3000,
      :DocumentRoot => Dir::pwd + "/lib/web/"
    )
    @@s.mount '/blog', BlogServlet
    @@s.start
  end

  def self.stop
    @@s.shutdown
  end
end
