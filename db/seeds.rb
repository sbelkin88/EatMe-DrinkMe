5.times do |i|
	venue = Venue.create(place_id: "#{i}", name: "Venue#{i}", address: "Post Rd#{i}", city: "Fairfield#{i}", state: "CT#{i}", zip: "06825-#{i}", phone: "203-222-#{i}", website: "#{i}www.martel.com")
end


100.times do |i|
	x = User.create!(username: "test#{i}", 
									email: "test#{i}@gmail.com", 
									password: "asdfasdf")

	a = x.experiences.create(name: "experience NR1 of User #{i}")
	b = x.experiences.create(name: "experience NR2 of User #{i}")	
	ven1 = Venue.first
	ven2 = Venue.last
	a.dishes.create(title: "pizza#{i}", review: "delicious cheese pizza#{i}", venue: ven1)
	b.dishes.create(title: "pizza#{i}", review: "delicious cheese pizza#{i}", venue: ven1)

	a.dishes.create(title: "pizza#{i}", review: "delicious cheese pizza#{i}", venue: ven2)
	b.dishes.create(title: "pizza#{i}", review: "delicious cheese pizza#{i}", venue: ven2)
end


