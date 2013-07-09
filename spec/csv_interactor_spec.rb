require_relative 'spec_helper'

describe "CSV interactor" do
  describe "saves a post" do
    it "assigns an id to the post" do
      post = Post.new(title: "Post 1", description: "Description of post 1")
      post = CSVInteractor.save_post post
      post.id.should_equal 1
    end

    it "saves a post" do
      post = Post.new(title: "Post 1", description: "Description of post 1")
      CSVInteractor.save_post post
      all_posts = CSV.read("lib/posts.csv")
      all_posts.first.should_equal ["Post 1", "Description of post 1"]
    end
  end

  describe "all posts" do
    it "loads title" do
      post = Post.new(title: "Post 1", description: "Description of post 1")
      CSVInteractor.save_post post
      all_posts = CSVInteractor.all_posts
      all_posts.first.title.should_equal "Post 1"
    end

    it "loads description" do
      post = Post.new(title: "Post 1", description: "Description of post 1")
      CSVInteractor.save_post post
      all_posts = CSVInteractor.all_posts
      all_posts.first.description.should_equal "Description of post 1"
    end
  end
end
