require_relative '../../blog'
require 'webrick'
include WEBrick
class BlogServlet < HTTPServlet::AbstractServlet
  def do_GET request, response
    File.open('lib/web/blog/all_posts.rhtml','r') do |f|
      @template = ERB.new(f.read)
    end
    blog_id = request.query["id"]
    @blog = Blog.find(blog_id.to_i)
    response.body = @template.result(binding)
    response['Content-Type'] = "text/html"
  end
end
