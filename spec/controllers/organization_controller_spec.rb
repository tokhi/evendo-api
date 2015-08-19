require 'rails_helper'

describe OrganizationsController, :type => :controller  do

  def build(num)
    org = nil
    num.times {
      org = Organization.create(name: "CinemaxX#{num}", country: "Germany",
                          city: "Berlin", address: "Potsdamer Straße 5, 10785 Berlin", telephone: "+49 40 80806969", email: "info@cinemaxx.de", category: "cinema")
      event = Event.create(title: "mad max trailer#{num}", description: "some description here..", ogranization_id: num, event_date: Date.parse("2015-10-13"), location: "Potsdamer Straße 5, 10785 Berlin", seat_nums: 100, price: "15 Eur",
                           category: "Movie", thumbnail: "http://example.com/xyz1.jpg", link: "http://example.com/xyz1.mp4", rating: "5", custom_fields: {"movieLength"=>"2 hours","PG"=>16,"Genre"=>"Action, thriller"})
    
    }
    org
  end

  it "assign @organization" do
    org = build(1)
    get :index
    expect(assigns(:organizations)).to eq([org])
  end



end
