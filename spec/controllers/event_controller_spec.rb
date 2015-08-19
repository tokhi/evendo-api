require 'rails_helper'

describe EventsController, :type => :controller  do

  def build(num)
    event = nil
    num.times {
      event = Event.create(title: "mad max trailer#{num}", description: "some description here..", ogranization_id: num, event_date: Date.parse("2015-10-13"), location: "Potsdamer Straße 5, 10785 Berlin", seat_nums: 100, price: "15 Eur",
                           category: "Movie", thumbnail: "http://example.com/xyz1.jpg", link: "http://example.com/xyz1.mp4", rating: "5", custom_fields: {"movieLength"=>"2 hours","PG"=>16,"Genre"=>"Action, thriller"})
    }
    event
  end
  it "assigns @event" do
    event = build(1)
    get :index
    expect(assigns(:events)).to eq([event])
  end

  it "get event by title" do
    build(2)
    get :index, {by_title: "trailer2"}
    expect(assigns(:events)[0].title).to eq("mad max trailer2")
  end

  it "get events by organization id" do
    build(3)
    get :index, {org_id: 1}
    expect(assigns(:events).count).to eq(1)
    get :index, {org_id: 2}
    expect(assigns(:events).count).to eq(1)
  end

end
