require_relative '../../spec_helper'
require_relative '../../constants'
require_relative '../../../lib/web/blog/post_servlet'
require 'net/http'

describe "Post Servlet" do
  initialize_test_server
  describe "do_GET" do
    describe "show" do
      it "loads all posts titles for the blog" do
        blog = Blog.new
        blog.add_post(title: POST_TITLE, description: POST_DESCRIPTION)
        response = Net::HTTP.get('localhost', "/posts?blog_id=#{blog.id}&id=#{blog.posts.first.id}", 3000)
        response.strip.should_equal "<h1>#{POST_TITLE}</h1>\n\n<p>#{POST_DESCRIPTION}</p>"
        File.delete('lib/posts.csv')
      end
    end

    describe "new" do
      it "loads the the form for a new post" do
        blog = Blog.new
        response = Net::HTTP.get('localhost', "/posts/new?blog_id=#{blog.id}", 3000)
        response.strip.should_equal(
        "<form name=\"new-post\" action=\"/posts\" method=\"post\">\n" +
        "Title: <input type=\"text\" name=\"title\"><br>\n" +
        "Description: <input type=\"text\" name=\"description\">\n" +
        "<input type=\"hidden\" name=\"blog_id\" value=2>\n"+
        "<input type=\"submit\" value=\"Save\">\n"+
        "</form>")
      end
    end
  end

  describe "do_POST" do
    it "creates a new post on the blog" do
      blog = Blog.new
      uri = URI.parse('http://localhost:3000/posts')
      Net::HTTP.post_form(uri, {"blog_id" => blog.id, title: POST_TITLE, description: POST_DESCRIPTION})
      blog.posts.count.should_equal 1
    end

    it "redirects to the list of posts" do
      blog = Blog.new
      uri = URI.parse('http://localhost:3000/posts')
      response = Net::HTTP.post_form(uri, {"blog_id" => blog.id, title: POST_TITLE, description: POST_DESCRIPTION})
      response.code.should_equal "303"
    end
  end

  stop_test_server
end
