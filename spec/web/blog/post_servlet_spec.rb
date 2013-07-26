require_relative '../../spec_helper'
require_relative '../../constants'
require_relative '../../../lib/web/blog/post_servlet'
require 'net/http'

describe "Post Servlet" do
  describe "do_GET" do
    it "loads all posts titles for the blog" do
      initialize_test_server
      blog = Blog.new
      blog.add_post(title: POST_TITLE, description: POST_DESCRIPTION)
      response = Net::HTTP.get('localhost', "/posts?blog_id=#{blog.id}&id=#{blog.posts.first.id}", 3000)
      response.strip.should_equal "<h1>#{POST_TITLE}</h1>\n\n<p>#{POST_DESCRIPTION}</p>"
      stop_test_server
      File.delete('lib/posts.csv')
    end
  end
end
