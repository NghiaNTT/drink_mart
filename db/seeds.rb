# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", role: 0)

5.times do |n|
  Product.create! name: "Coca cola" + (n+1).to_s,
    price: "10000",
    description: "good",
    quantity: 200,
    image: "/assets/coca.jpg",
    average: 0,
    category_id: 1
  end

5.times do |n|
  Product.create! name: "Lavie" + (n+1).to_s,
    price: "10000",
    description: "good",
    quantity: 200,
    image: "/assets/lavie.jpg",
    average: 0,
    category_id: 1
  end

Category.create! title: "Soda"

Order.create! id: 1
