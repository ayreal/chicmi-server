# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(
  name: "Ariel",
  password: "abc",
  email: "aeh.herman@gmail.com",
  photo: "https://avatars0.githubusercontent.com/u/22643036?s=460&v=4",
  city_id: 2990574,
  username: "ayreal",
  twitter: "https://twitter.com/ayrealism",
  instagram: "https://www.instagram.com/ayreal/",
  bio: "Fan of fancy frocks in NYC"
)
