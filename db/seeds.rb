sam = User.create(username: "sbelkin", email: "sam@gmail.com", password_digest: "12345")
experience = sam.experiences.create(unique_place_id: "Martel", user_id: 1)
dish = experience.dishes.create(title: "pizza", review: "delicious cheese pizza")
dish2 = experience.dishes.create(title: "lo mein", review: "delicious")
