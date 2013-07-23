class Post
  attr_reader :title, :description, :id, :blog_id
  def initialize(args={})
    @id = args[:id]
    @title = args[:title]
    @description = args[:description]
  end

  private
  def id= id
    @id = id
  end
end
