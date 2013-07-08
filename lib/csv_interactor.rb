require 'csv'
class CSVInteractor
  def self.save_post post
    CSV.open("lib/posts.csv", "wb") do |csv|
      csv << [post.title,post.description]
    end
  end
end
