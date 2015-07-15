# create dummy orgs
2.upto(15) do |index|
	Organization.create(name: "xyz#{index}", country: "Germany", 
		city: "Berlin", address: "Postsdam, Gribnizee str #{index}", telephone: "+49 1234 #{index}", email: "abc#{index}@xyz#{index}.com")	
end