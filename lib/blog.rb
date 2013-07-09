class Blog
  attr_reader :name, :posts
  def initialize(args={})
    @posts = []
  end

  def add_post args
    post = Post.new(args)
    CSVInteractor.save_post post
    @posts << post
  end
end
