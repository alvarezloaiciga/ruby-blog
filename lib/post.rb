class Post
  attr_reader :title
  def initialize args
    @title = args[:title]
  end
end
