require_relative 'spec_helper'
require_relative 'constants'

describe "CSV interactor" do
  File.delete('lib/posts.csv') if File.exist?('lib/posts.csv')

  describe "saves a post" do
    it "assigns an id to the post" do
      blog = Blog.new
      post = Post.new(title: POST_TITLE, description: POST_DESCRIPTION)
      post = CSVInteractor.save_post post, blog
      post.id.should_equal 1

      File.delete('lib/posts.csv')
    end

    it "assings a blog id to the post" do
      blog = Blog.new
      post = Post.new(title: POST_TITLE, description: POST_DESCRIPTION)
      post = CSVInteractor.save_post post, blog
      post.blog_id.should_equal blog.id

      File.delete('lib/posts.csv')
    end

    it "saves a post" do
      blog = Blog.new
      post = Post.new(title: POST_TITLE, description: POST_DESCRIPTION)
      CSVInteractor.save_post post, blog
      all_posts = CSV.read("lib/posts.csv")
      all_posts.first.should_equal ["1",POST_TITLE, POST_DESCRIPTION, blog.id.to_s]

      File.delete('lib/posts.csv')
    end
  end

  describe "all posts" do
    it "loads title" do
      blog = Blog.new
      post = Post.new(title: POST_TITLE, description: POST_DESCRIPTION)
      CSVInteractor.save_post post, blog
      all_posts = CSVInteractor.all_posts
      all_posts.first.title.should_equal post.title

      File.delete('lib/posts.csv')
    end

    it "loads description" do
      blog = Blog.new
      post = Post.new(title: POST_TITLE, description: POST_DESCRIPTION)
      CSVInteractor.save_post post, blog
      all_posts = CSVInteractor.all_posts
      all_posts.first.description.should_equal post.description

      File.delete('lib/posts.csv')
    end

    it "loads id" do
      blog = Blog.new
      post = Post.new(title: POST_TITLE, description: POST_DESCRIPTION)
      CSVInteractor.save_post post, blog
      all_posts = CSVInteractor.all_posts
      all_posts.first.id.should_equal post.id

      File.delete('lib/posts.csv')
    end

    it "loads the blog id" do
      blog = Blog.new
      post = Post.new(title: POST_TITLE, description: POST_DESCRIPTION)
      CSVInteractor.save_post post, blog
      all_posts = CSVInteractor.all_posts
      all_posts.first.blog_id.should_equal blog.id

      File.delete('lib/posts.csv')
    end
  end
end
