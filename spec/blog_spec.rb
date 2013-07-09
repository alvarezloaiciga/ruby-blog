require_relative 'spec_helper'

describe "blog" do
  it "has posts" do
    blog = Blog.new
    blog.posts.should_equal []
  end

  describe ".add_post" do
    File.delete('lib/posts.csv') if File.exist?('lib/posts.csv')

    it "adds title" do
      blog = Blog.new
      blog.add_post(title: "First post in blog", description: "This is a magical post")
      blog.posts.first.title.should_equal "First post in blog"
      File.delete('lib/posts.csv')
    end

    it "adds description" do
      blog = Blog.new
      blog.add_post(title: "First post in blog", description: "This is a magical post")
      blog.posts.first.description.should_equal "This is a magical post"
      File.delete('lib/posts.csv')
    end

    it "adds id" do
      blog = Blog.new
      blog.add_post(title: "First post in blog", description: "This is a magical post")
      blog.posts.first.id.should_equal 1
      File.delete('lib/posts.csv')
    end
  end

  describe ".remove_post" do
    it "removes the posts from the blog" do
      blog = Blog.new
      blog.add_post(title: "First post in blog", description: "This is a magical post")
      post = blog.posts.first
      blog.remove_post post.id
      blog.posts.should_equal []
      File.delete('lib/posts.csv')
    end
  end
end
