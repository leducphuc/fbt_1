User.create name: "admin",is_admin: true, email: "admin@admin.com",
  password: "password"

User.create name: "normal", email: "normal@email.com", password: "password"
Review.create title: "Review 1", content: "content 1", user_id: "1"

40.times do |n|
  name = "user#{n}"
  email = "user#{n}@email.com"
  password = "password"
  User.create name: name, email: email, password: password
end

Place.create name: "Ha Noi", url_image: "http://i.imgur.com/23bJAN3.jpg"
Place.create name: "Da Nang", url_image: "http://i.imgur.com/Jr9n0JG.jpg"
Place.create name: "Co To", url_image: "http://i.imgur.com/Ncpw8cJ.png"
Place.create name: "Sa Pa", url_image: "http://i.imgur.com/8uOnyCg.jpg"
Place.create name: "Moc Chau", url_image: "http://i.imgur.com/z5WmdZR.jpg"
Place.create name: "Ly Son", url_image: "http://i.imgur.com/gMQP6K6.jpg"
Place.create name: "Ha Long", url_image: "http://i.imgur.com/sNJSrQv.jpg"
Place.create name: "Ba Vi", url_image: "http://i.imgur.com/TBfgEWd.jpg"
Place.create name: "Hue", url_image: "http://i.imgur.com/p7oFjhV.jpg"
Place.create name: "Nha Trang", url_image: "http://i.imgur.com/07Iz3jH.jpg"

Category.create name: "Du lich bien", cover: "http://i.imgur.com/3sUOjfH.jpg"
Category.create name: "Du lich sinh thai", cover: "http://i.imgur.com/AkLaFYY.jpg"
