require_relative 'spec_helper'

describe "blog" do
  it "has a name" do
    blog = Blog.new(name: "Blog 1")
    blog.name.should_equal "Blog 1"
  end
end
