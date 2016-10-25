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

Place.create name: "Sa Pa",
  url_image: "http://i.imgur.com/8uOnyCg.jpg",
  description: "This is Sa pa"
Place.create name: "Moc Chau",
  url_image: "http://i.imgur.com/z5WmdZR.jpg",
  description: "This is Moc Chau"
Place.create name: "Ly Son",
  url_image: "http://i.imgur.com/gMQP6K6.jpg",
  description: "This is Ly Son"
Place.create name: "Ha Long",
  url_image: "http://i.imgur.com/sNJSrQv.jpg",
  description: "This is Ha Long"
Place.create name: "Ba Vi",
  url_image: "http://i.imgur.com/TBfgEWd.jpg",
  description: "This is Ba vi"
Place.create name: "Hue",
  url_image: "http://i.imgur.com/p7oFjhV.jpg",
  description: "This is Hue"
Place.create name: "Nha Trang",
  url_image: "http://i.imgur.com/07Iz3jH.jpg",
  description: "This is Nha Trang"
Category.create name: "Du lich bien", cover: "http://i.imgur.com/3sUOjfH.jpg"
Category.create name: "Du lich sinh thai", cover: "http://i.imgur.com/AkLaFYY.jpg"
