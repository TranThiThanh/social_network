User.create!(username: "Hp min cuoi", email: "thanhmituot13@gmail.com",
  password: "10102010", password_confirmation: "10102010",
  isActivity: true, activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username: name, email: email, password: password,
    password_confirmation: password,
    isActivity: true, activated_at: Time.zone.now)
end
