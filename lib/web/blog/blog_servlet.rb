require_relative '../../blog'
require 'webrick'
include WEBrick
class BlogServlet < HTTPServlet::AbstractServlet
  def do_GET request, response
    blog = Blog.new
    blog.add_post(title: "Hey Man!", description: "description 1")
    blog.add_post(title: "Hey Man 2", description: "description 2")
    File.open('lib/web/blog/all_posts.rhtml','r') do |f|
      @template = ERB.new(f.read)
    end
    blog_id = request.query["id"]
    @blog = Blog.find(blog_id.to_i)
    response.body = @template.result(binding)
    response['Content-Type'] = "text/html"
  end
end
