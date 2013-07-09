require 'csv'
class CSVInteractor
  def self.save_post post
    if File.exist?("lib/posts.csv")
      id = CSV.read("lib/posts.csv").count + 1
      post.send(:id=, id)
    else
      post.send(:id=, 1)
    end


    CSV.open("lib/posts.csv", "ab") do |csv|
      csv << [post.id, post.title,post.description]
    end

    post
  end

  def self.all_posts
    posts = CSV.read("lib/posts.csv")
    posts.map{|post_attr| Post.new(id:post_attr[0], title: post_attr[1], description: post_attr[2])}
  end
end
