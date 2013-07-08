require_relative 'spec_helper'

describe "CSV interactor" do
  it "saves a post" do
    post = Post.new(title: "Post 1", description: "Description of post 1")
    CSVInteractor.save_post post
    all_posts = CSV.read("lib/posts.csv")
    all_posts.first.should_equal ["Post 1", "Description of post 1"]
  end
end
