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

  def remove_post post_id
    self.posts.delete_if{|post| post.id == post_id}
  end
end
