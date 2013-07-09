require_relative 'spec_helper'

describe "Post" do
  it "has an id" do
    post = Post.new
    post.id.should_be_nil
  end

  it "has a title" do
    title = "First post"
    post = Post.new(title: title)
    post.title.should_equal title
  end

  it "has a description" do
    description = "This is my first post!"
    post = Post.new(description: description)
    post.description.should_equal description
  end
end
