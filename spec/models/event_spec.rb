require 'rails_helper'

RSpec.describe Event, type: :model do

  def build
  	Organization.create(name: "CinemaxX", country: "Germany", 
		city: "Berlin", address: "Potsdamer Straße 5, 10785 Berlin", telephone: "+49 40 80806969", email: "info@cinemaxx.de", category: "cinema")	

  	Event.create(title: "mad max trailer", description: "some description here..", ogranization_id: 1, event_date: Date.parse("2015-10-13"), location: "Potsdamer Straße 5, 10785 Berlin", seat_nums: 100, price: "15 Eur", 
    	category: "Movie", thumbnail: "http://example.com/xyz1.jpg", link: "http://example.com/xyz1.mp4", rating: "5", custom_fields: {"movieLength"=>"2 hours","PG"=>16,"Genre"=>"Action, thriller"}) 
  	
  	Event.create(title: "Fast and furious trailer", description: "some description here..", ogranization_id: 1, event_date: Date.parse("2015-10-13"), location: "Potsdamer Straße 5, 10785 Berlin", seat_nums: 100, price: "15 Eur", 
    	category: "Movie", thumbnail: "http://example.com/xyz1.jpg", link: "http://example.com/xyz1.mp4", rating: "5", custom_fields: {"movieLength"=>"2 hours","PG"=>16,"Genre"=>"Action, thriller"}) 
  end
  it "create an event" do
  	build
  	expect(Event.first.title).to eq("mad max trailer")
  end

  it "search event by title" do
  	build
  	expect(Event.by_title("xyz").count).to eq(0)
  	expect(Event.by_title("fast").count).to eq(1)
  	expect(Event.by_title("trailer").count).to eq(2)
  end

end
