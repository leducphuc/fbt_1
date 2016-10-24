User.create name: "admin",is_admin: true, email: "admin@admin.com",
  password: "password"

User.create name: "normal", email: "normal@email.com", password: "password"
Tour.create name: "Tour1", duration: "3", description: "description1"

40.times do |n|
  name = "user#{n}"
  email = "user#{n}@email.com"
  password = "password"
  User.create name: name, email: email, password: password
end

Place.create name: "Ha Noi", url_image: "hanoi.jpg"
Place.create name: "Da Nang", url_image: "danang.jpg"
Place.create name: "Co To", url_image: "coto.jpg"
Place.create name: "Sa Pa", url_image: "sapa.jpg"
Place.create name: "Moc Chau", url_image: "mocchau.jpg"
Place.create name: "Ly Son", url_image: "lyson.jpg"
Place.create name: "Ha Long", url_image: "halong.jpg"
Place.create name: "Ba Vi", url_image: "bavi.jpg"
Place.create name: "Hue", url_image: "hue.jpg"
Place.create name: "Nha Trang", url_image: "nhatrang.jpg"
