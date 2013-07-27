require_relative '../../blog'
require 'webrick'
include WEBrick

class PostServlet < HTTPServlet::AbstractServlet
  def do_GET request, response
    if is_new_path? request.path
      render_new_template request, response
    else
      render_show_template request, response
    end
  end

  def do_POST request, response
    blog = Blog.find(request.query["blog_id"].to_i)
    blog.add_post(title: request.query["title"],
                 description: request.query["description"])
    response.set_redirect(WEBrick::HTTPStatus[303], "/blog?id=#{blog.id}")
  end

  private
  def render_new_template request, response
    File.open('lib/web/blog/new_post.rhtml', 'r') do |f|
      @template = ERB.new(f.read)
    end
    @blog_id = request.query["blog_id"]
    response.body = @template.result(binding)
    response['Content-Type'] = "text/html"
  end

  def render_show_template request, response
    File.open('lib/web/blog/post_show.rhtml', 'r') do |f|
      @template = ERB.new(f.read)
    end
    blog = Blog.find(request.query["blog_id"].to_i)
    @post = blog.find_post(request.query["id"].to_i)
    response.body = @template.result(binding)
    response['Content-Type'] = "text/html"
  end

  def is_new_path? path
    path_sections = path[1..-1].split "/"
    path_sections[1] && path_sections[1] == "new"
  end
end
