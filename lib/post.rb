class Post
  attr_reader :title, :description, :id
  def initialize(args={})
    @title = args[:title]
    @description = args[:description]
  end
end
