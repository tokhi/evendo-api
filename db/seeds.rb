require 'csv'
require 'net/http'
# require 'video_info'
# create dummy orgs
# 1.upto(15) do |index|
	Organization.create(name: "CinemaxX", country: "Germany", 
		city: "Berlin", address: "Potsdamer Straße 5, 10785 Berlin", telephone: "+49 40 80806969", email: "info@cinemaxx.de", category: "cinema")	

	Organization.create(name: "CineStar Berlin & IMAX", country: "Germany", 
		city: "Berlin", address: "Potsdamer Straße 4, 10785 Berlin", telephone: "+49 30 26066400", email: "info@imax.com", category: "cinema")	
# end

# 1.upto(10) do |index|
#     Event.create(title: "cool event #{Random.rand(1000)}", ogranization_id: index, event_date: Date.today , location: "Postdam, Gribnitzee str #{index}", seat_nums: 30, price: "#{Random.rand(100)} Eur", 
#     	category: "Movies", thumbnail: "http://lorempixel.com/400/200/sports/") 
# end
 

def time_range
 time_table = {"08:00"=>0,"09:00"=>0,"10:00"=>0,"11:00"=>0,"12:00"=>0,"13:00"=>1,"14:00"=>0,"15:00"=>1,"16:00"=>1,"17:00"=>0,"18:00"=>1,"19:00"=>1,"19:00"=>1,"19:00"=>0,"19:00"=>1,"19:00"=>1,"19:00"=>0}
end

csv_text = File.read('public/trailers.csv')
csv = CSV.parse(csv_text, :headers => true)
VideoInfo.provider_api_keys = { youtube:  'AIzaSyDtkGT4YUI3UfTSHqMmkx-S-NtyueGjhRI' }
csv.each do |row|
  # Event.create!(row.to_hash)
  @video =  VideoInfo.new(row[1])
  if(@video.title.downcase.include? "trailer")
    tIndex = @video.title.downcase.index("trailer")+6
  else
    tIndex=50
  end
  Event.create(title: @video.title[0..tIndex], description: @video.description, ogranization_id: 1, event_date: Date.parse("2015-10-13"), location: "Potsdamer Straße 5, 10785 Berlin", seat_nums: 100, price: "15 Eur", 
    	category: "Movie", thumbnail: @video.thumbnail_medium, link: row[1], rating: "5", custom_fields: {"movieLength"=>"2 hours","PG"=>16,"Genre"=>"Action, thriller", "TimeSchedual"=> time_range}) 
end

# change movie's cinema
Event.all.each do |e|
  if e.id > 15
  	e.ogranization_id = 2
  	e.location = "Potsdamer Straße 4, 10785 Berlin"
  	e.save
  end
end
