class Blog
  attr_reader :name, :posts
  def initialize args
    @name = args[:name]
    @posts = []
  end

  def add_post args
    @posts << Post.new(args)
  end
end
