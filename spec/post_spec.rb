require_relative 'spec_helper'
require_relative 'constants'

describe "Post" do
  it "has an id" do
    post = Post.new
    post.id.should_be_nil
  end

  it "has a blog id" do
    post = Post.new(blog_id: BLOG_ID)
    post.blog_id.should_equal BLOG_ID
  end

  it "has a title" do
    post = Post.new(title: POST_TITLE)
    post.title.should_equal POST_TITLE
  end

  it "has a description" do
    post = Post.new(description: POST_DESCRIPTION)
    post.description.should_equal POST_DESCRIPTION
  end
end
