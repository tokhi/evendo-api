class Event < ActiveRecord::Base
  belongs_to :ogranization
  scope :by_title, -> title {where("title LIKE ?", "%#{title}%")}
  scope :org_id, -> id {where(:id => id)}

  def details
    client = Yourub::Client.new
    # => {"id"=>"Rw1xk9kRQ-g", "snippet"=>{"title"=>"THE LOOK OF SILENCE Trailer", "thumbnails"=>{"default"=>{"url"=>"https://i.ytimg.com/vi/Rw1xk9kRQ-g/default.jpg", "width"=>120, "height"=>90}, "medium"=>{"url"=>"https://i.ytimg.com/vi/Rw1xk9kRQ-g/mqdefault.jpg", "width"=>320, "height"=>180}, "high"=>{"url"=>"https://i.ytimg.com/vi/Rw1xk9kRQ-g/hqdefault.jpg", "width"=>480, "height"=>360}}}, "statistics"=>{"viewCount"=>"217"}}
      v = client.search(query: "#{title} film trailer")  do |v|
      puts "~>*~> #{v}"
      self.link = "https://www.youtube.com/watch?v=#{v["id"]}"
      self.thumbnail = v["snippet"]["thumbnails"]["medium"]["url"]
     end
  end
end
