require_relative 'spec_helper'

describe "Post" do
  it "has a title" do
    title = "First post"
    post = Post.new(title: title)
    post.title.should_equal title
  end
end
