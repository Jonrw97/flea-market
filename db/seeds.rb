# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Item.create(item_name: "car", description: "broken", price: 1000, user_id: 1)
require 'open-uri'

p 'Cleaning db'
Receipt.destroy_all
Item.destroy_all
User.destroy_all

p 'Creating users'

user1 = User.create(
  first_name: "Campbell",
  last_name: "Davies-Webb",
  address: "Neverland",
  email: "camie@gmail.com",
  password: 'test123'
)
p "Created user id: #{user1.id}"
p "Creating items for user #{user1.id}"

item1 = Item.new(
  item_name: "Mustang",
  description: "Is a stallion not only in bed",
  price: 10_000,
  user_id: user1.id
)
item1.photo.attach(
  filename: 'mustang.jpg',
  content_type: 'image/jpg',
  io: URI.open('https://res.cloudinary.com/dgnolwlop/image/upload/v1678196003/tscjdqtzp3g0l3vle799.jpg')
)
item1.save
p "Created item id: #{item1.id}"

item2 = Item.new(
  item_name: "Taylormade Clubs",
  description: "Good as new clubs for sale",
  price: 2000,
  user_id: user1.id
)
item2.photo.attach(
  filename: 'Taylormade_Clubs.jpg',
  content_type: 'image/jpg',
  io: URI.open('https://res.cloudinary.com/dgnolwlop/image/upload/v1678269083/development/cmamazs1zql7gfgckfr8zweea2hr.jpg')
)
item2.save
p "Created item id: #{item2.id}"

######

user2 = User.create(
  first_name: "Jonathan",
  last_name: "Watkins",
  address: "pluto",
  email: "jon@gmail.com",
  password: 'test123'
)
p "Created user id: #{user2.id}"
p "creating items for user #{user2.id}"

item3 = Item.new(
  item_name: "Bugatti",
  description: "Incredibly fast whip - so fast it'll blow your eye balls out ",
  price: 100000,
  user_id: user2.id
)
item3.photo.attach(
  filename: 'Bugatti.jpg',
  io: URI.open('https://res.cloudinary.com/dgnolwlop/image/upload/v1678268288/development/twyflqhqig5jynkiwfvllrmyijw2.jpg')
)
item3.save
p "Created item id: #{item3.id}"

item4 = Item.new(
  item_name: "PS5",
  description: "Better than Xbox",
  price: 2000,
  user_id: user2.id
)
item4.photo.attach(
  filename: 'PS5.jpg',
  io: URI.open('https://res.cloudinary.com/dgnolwlop/image/upload/v1678264385/development/1m2ywilg24jbp26jy9dzv0fng5ho.jpg')
)
item4.save
p "Created item id: #{item4.id}"

#####

user3 = User.create(
  first_name: "Saaj",
  last_name: "Mathen",
  address: "Mars",
  email: "saaj@gmail.com",
  password: 'test123'
)
p "Created user id: #{user3.id}"
p "creating items for user #{user3.id}"

item5 = Item.new(
  item_name: "Capybara",
  description: "veryyyyyyyyy Big rat",
  price: 1500,
  user_id: user3.id
)
item5.photo.attach(
  filename: 'Capybara.jpg',
  io: URI.open('https://res.cloudinary.com/dgnolwlop/image/upload/v1678204935/development/rdia9ked3odd9cohfy9urt9598ce.jpg')
)
item5.save
p "Created item id: #{item5.id}"

item6 = Item.new(
  item_name: "Open Bottle of tequila",
  description: "1 tequila, 2 tequila, 3 tequila, floor ...",
  price: 2000,
  user_id: user3.id
)
item6.photo.attach(
  filename: 'Open_Bottle_of_tequila.jpg',
  io: URI.open('https://res.cloudinary.com/dgnolwlop/image/upload/v1678267596/development/dsrl8qcb8btjaumdasx0ya7d9qvx.jpg')
)
item6.save
p "Created item id: #{item6.id}"

#####

user4 = User.create(
  first_name: "Joshua",
  last_name: "Singrew",
  address: "Uranus",
  email: "topshagger@gmail.com",
  password: 'test123'
)
p "Created user id: #{user4.id}"
p "creating items for user #{user4.id}"

item7 = Item.new(
  item_name: "Lifesize Iron-man suit",
  description: "Live out your iron-man fantasies - women not included -",
  price: 5000,
  user_id: user4.id
)
item7.photo.attach(
  filename: 'Lifesize_Iron_man_suit.jpg',
  io: URI.open('https://res.cloudinary.com/dgnolwlop/image/upload/v1678267495/development/bgu1f5jnwy4ydpbzefnc9hcvi2yb.jpg')
)
item7.save
p "Created item id: #{item7.id}"

item8 = Item.new(
  item_name: "Chucky",
  description: "will watch your kids when you go out for dinner.",
  price: 2000,
  user_id: user4.id
)
item8.photo.attach(
  filename: 'Chucky.jpg',
  io: URI.open('https://res.cloudinary.com/dgnolwlop/image/upload/v1678267515/development/9f8lgbpqsb1wt8k99t57g9ia5gch.jpg')
)
item8.save
p "Created item id: #{item8.id}"

p "Seed complete"
