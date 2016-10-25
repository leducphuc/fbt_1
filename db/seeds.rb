User.create name: "admin",is_admin: true, email: "admin@admin.com",
  password: "password"

User.create name: "normal", email: "normal@email.com", password: "password"
Review.create title: "Review 1", content: "content 1", user_id: "1"
Tour.create name: "Tour1", duration: "3", description: "description1"

40.times do |n|
  name = "user#{n}"
  email = "user#{n}@email.com"
  password = "password"
  User.create name: name, email: email, password: password
end

