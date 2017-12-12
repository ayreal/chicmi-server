# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
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

Event.find_or_create_by(
  external_id: "11878",
  address_business_name: "Apropo Studio",
  address_street_1: "43 West 24th Street",
  address_street_2: "4th Floor",
  address_city: "New York",
  address_zip: "10010",
  event_name_en:"Apropo Studio Sample Sale",
  start_date: "2017-10-23 10:00:00",
  end_date:"2017-12-13 17:00:00",
  slug: "apropo-studio-sample-sale-october-2017",
  summary:"There'll be up to 60% off retail prices on men's and women's ready to wear plus homeware at this sample sale from Apropo Studio - featuring Avant Toi, AS65, Bazar Deluxe, Lost In Me, Gilda Midani, Faliero Sarti, Sanchita, Private 0204, Italia Indepen..."
)

Designer.find_or_create_by(external_id: "4117", designer_name_en: "Quest Collection")
Comment.find_or_create_by(text: "This event looks amazing!")
