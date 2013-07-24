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
    posts = CSV.read("lib/posts.csv", headers: [:id, :title, :description, :blog_id, :deleted])
    posts.map{|post_attr| Post.new(id:post_attr[:id].to_i,
                                   title: post_attr[:title],
                                   description: post_attr[:description],
                                   blog_id: post_attr[:blog_id].to_i)}
  end

  def self.delete_post post
    posts = CSV.read("lib/posts.csv", headers: [:id, :title, :description, :blog_id, :deleted])
    posts[post.id-1][:deleted] = "deleted"
    CSV.open('lib/posts.csv', "wb") do |csv|
      csv << posts.collect{|post| [post[:id], post[:title], post[:description], post[:blog_id], post[:deleted]]}.flatten
    end
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
