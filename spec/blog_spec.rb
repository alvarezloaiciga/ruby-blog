require_relative 'spec_helper'

describe "blog" do
  it "has posts" do
    blog = Blog.new
    blog.posts.should_equal []
  end

  describe ".add_post" do
    it "adds title" do
      blog = Blog.new
      blog.add_post(title: "First post in blog", description: "This is a magical post")
      blog.posts.first.title.should_equal "First post in blog"
    end

    it "adds description" do
      blog = Blog.new
      blog.add_post(title: "First post in blog", description: "This is a magical post")
      blog.posts.first.description.should_equal "This is a magical post"
    end

    it "adds id" do
      blog = Blog.new
      blog.add_post(title: "First post in blog", description: "This is a magical post")
      blog.posts.first.id.should_equal 1
    end
  end
end
