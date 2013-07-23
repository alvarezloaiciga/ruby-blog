require 'csv'
class CSVInteractor
  def self.save_post post, blog
    CSV.open("lib/posts.csv", "ab") do |csv|
      post.send(:id=, next_id)
      post.send(:blog_id=, blog.id)
      csv << [post.id, post.title,post.description, blog.id]
    end
    post
  end

  def self.all_posts
    posts = CSV.read("lib/posts.csv")
    posts.map{|post_attr| Post.new(id:post_attr[0].to_i,
                                   title: post_attr[1],
                                   description: post_attr[2],
                                   blog_id: post_attr[3].to_i)}
  end

  private
  def self.next_id
    begin
      return CSV.read("lib/posts.csv").count + 1
    rescue
      return 1
    end
  end

end
