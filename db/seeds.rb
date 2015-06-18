sam = User.create(username: "sbelkin", email: "sam@gmail.com", password_digest: "12345")
experience = sam.experiences.build(unique_place_id: "Martel")
dish = experience.dishes.build(title: "pizza", review: "delicious cheese pizza")
dish2 = experience.dishes.build(title: "lo mein", review: "delicious")
