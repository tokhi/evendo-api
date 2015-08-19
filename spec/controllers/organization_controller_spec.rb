require 'rails_helper'

describe OrganizationsController, :type => :controller  do

  def build(num)
    org = nil
    num.times {
      org = Organization.create(name: "CinemaxX#{num}", country: "Germany",
                          city: "Berlin", address: "Potsdamer Straße 5, 10785 Berlin", telephone: "+49 40 80806969", email: "info@cinemaxx.de", category: "cinema")
    }
    org
  end

  it "assign @organization" do
    org = build(1)
    get :index
    expect(assigns(:organizations)).to eq([org])
  end

end
