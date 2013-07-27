require_relative '../../blog'
require 'webrick'
include WEBrick

class PostServlet < HTTPServlet::AbstractServlet
  def do_GET request, response
    File.open('lib/web/blog/post_show.rhtml', 'r') do |f|
      @template = ERB.new(f.read)
    end
    blog = Blog.find(request.query["blog_id"].to_i)
    @post = blog.find_post(request.query["id"].to_i)
    response.body = @template.result(binding)
    response['Content-Type'] = "text/html"
  end

  def do_POST request, response
    blog = Blog.find(request.query["blog_id"].to_i)
    blog.add_post(title: request.query["title"],
                 description: request.query["description"])
  end
end
