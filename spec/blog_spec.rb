require_relative 'spec_helper'
require_relative 'constants'

describe "blog" do
  it "has posts" do
    blog = Blog.new
    blog.posts.should_equal []
  end

  it "has an id" do
    blog = Blog.new
    blog.id.should_not_be_nil
  end

  describe "all" do
    it "includes all created blogs" do
      blog = Blog.new
      Blog.all.last.should_equal blog
    end
  end

  describe "find" do
    describe "blog exists" do
      it "returns a blog if exists" do
        blog = Blog.new
        Blog.find(blog.id).should_equal blog
      end

      it "adds the blog posts" do
       # blog = Blog.new
       # blog.add_post(title: EMPTY_POST_TITLE)
      end
    end

    it "returns nil if it doesn't exist" do
      blog = Blog.new
      Blog.find(blog.id+1).should_equal nil
    end
  end

  describe ".add_post" do
    File.delete('lib/posts.csv') if File.exist?('lib/posts.csv')

    it "adds title" do
      blog = Blog.new
      blog.add_post(title: POST_TITLE, description: POST_DESCRIPTION)
      blog.posts.first.title.should_equal POST_TITLE
      File.delete('lib/posts.csv')
    end

    it "adds description" do
      blog = Blog.new
      blog.add_post(title: POST_TITLE, description: POST_DESCRIPTION)
      blog.posts.first.description.should_equal POST_DESCRIPTION
      File.delete('lib/posts.csv')
    end

    it "adds id" do
      blog = Blog.new
      blog.add_post(title: POST_TITLE, description: POST_DESCRIPTION)
      blog.posts.first.id.should_equal 1
      File.delete('lib/posts.csv')
    end

    it "adds the blog id" do
      blog = Blog.new
      blog.add_post(title: POST_TITLE, description: POST_DESCRIPTION)
      blog.posts.first.blog_id.should_equal blog.id
      File.delete('lib/posts.csv')
    end
  end

  describe ".remove_post" do
    it "removes the posts from the blog" do
      blog = Blog.new
      blog.add_post(title: POST_TITLE, description: POST_DESCRIPTION)
      post = blog.posts.first
      blog.remove_post post.id
      blog.posts.should_equal []
      File.delete('lib/posts.csv')
    end

    it "removes it from all posts" do
      blog = Blog.new
      blog.add_post(title: POST_TITLE, description: POST_DESCRIPTION)
      post = blog.posts.first
      blog.remove_post post.id
      CSVInteractor.all_posts.should_equal []
      File.delete('lib/posts.csv')
    end
  end
end
