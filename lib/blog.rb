require_relative 'post'
require_relative 'csv_interactor'
class Blog
  attr_reader :name, :posts, :id
  @@next_id = 1
  @@all = []

  def self.all
    @@all
  end

  def self.find(id)
    @@all.find{|blog| blog.id == id}
  end

  def initialize
    @posts = []
    @id = @@next_id
    @@next_id += 1
    @@all << self
  end

  def add_post args
    post = Post.new(args)
    CSVInteractor.save_post post, self
    @posts << post
  end

  def find_post post_id
    posts.find{|p| p.id == post_id}
  end

  def remove_post post_id
    post = find_post post_id
    posts.delete(post)
    CSVInteractor.delete_post post
  end
end
