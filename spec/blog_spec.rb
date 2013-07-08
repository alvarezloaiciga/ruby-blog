require_relative 'spec_helper'

describe "blog" do
  it "has a name" do
    blog = Blog.new(name: "Blog 1")
    blog.name.should_equal "Blog 1"
  end

  it "has posts" do
    blog = Blog.new(name: "Blog 1")
    blog.posts.should_equal []
  end

  describe ".add_post" do
    it "adds title" do
      blog = Blog.new(name: "Blog 1")
      blog.add_post(title: "First post in blog", description: "This is a magical post")
      blog.posts.first.title.should_equal "First post in blog"
    end
  end
end
