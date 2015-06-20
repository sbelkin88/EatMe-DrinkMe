sam = User.create(username: "sbelkin", email: "sam@gmail.com",encrypted_password: "asdf")
venue = Venue.create(name: "Martel", address: "Post Rd", city: "Fairfield", state: "CT", zip: "06825", phone: "203-222-2222", website: "www.martel.com")
experience = sam.experiences.build(venue: venue)
experience.save
dish = experience.dishes.build(title: "pizza", review: "delicious cheese pizza")
dish.save
dish2 = experience.dishes.build(title: "lo mein", review: "delicious")
dish2.save
