require 'csv'
class CSVInteractor
  def self.save_post post
    CSV.open("lib/posts.csv", "wb") do |csv|
      csv << [post.title,post.description]
    end
  end

  def self.all_posts
    posts = CSV.read("lib/posts.csv")
    posts.map{|post_attr| Post.new(title: post_attr[0])}
  end
end
