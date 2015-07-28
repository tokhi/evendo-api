
# create dummy orgs
1.upto(15) do |index|
	Organization.create(name: "xyz#{index}", country: "Germany", 
		city: "Berlin", address: "Postsdam, Gribnizee str #{index}", telephone: "+49 1234 #{index}", email: "abc#{index}@xyz#{index}.com", category: "cinema")	
end

1.upto(10) do |index|
    Event.create(title: "cool event #{Random.rand(1000)}", ogranization_id: index, event_date: Date.today , location: "Postdam, Gribnitzee str #{index}", seat_nums: 30, price: "20 Eur") 
end
