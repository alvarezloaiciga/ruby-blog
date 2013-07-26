require_relative '../../spec_helper'
require_relative '../../constants'
require_relative '../../../lib/web/blog/blog_servlet'
require 'net/http'

describe "Blog Servlet" do
  describe "do_GET" do
    it "loads all posts titles for the blog" do
      initialize_test_server
      blog = Blog.new
      blog.add_post(title: POST_TITLE, description: POST_DESCRIPTION)
      blog.add_post(title: POST_TITLE_2, description: POST_DESCRIPTION_2)
      response = Net::HTTP.get('localhost', "/blog?id=#{blog.id}", 3000)
      response.strip.should_equal "<p>#{POST_TITLE}</p>\n\n<p>#{POST_TITLE_2}</p>"
      stop_test_server
    end
  end
end
