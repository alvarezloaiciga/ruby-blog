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
    posts = read_file
    posts.select{|post| post[:deleted].nil? }.map do |post_attr|
      Post.new(id:post_attr[:id].to_i,
               title: post_attr[:title],
               description: post_attr[:description],
               blog_id: post_attr[:blog_id].to_i)
    end
  end

  def self.delete_post post
    posts = read_file
    posts[post.id-1][:deleted] = "deleted"
    CSV.open('lib/posts.csv', "wb") do |csv|
      posts.collect(&:fields).each{|post_row| csv << post_row}
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

  def self.read_file
    CSV.read("lib/posts.csv", headers: [:id, :title, :description, :blog_id, :deleted])
  end

end
