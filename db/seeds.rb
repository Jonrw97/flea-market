# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Item.create(item_name: "car", description: "broken", price: 1000, user_id: 1)
require 'faker'

p 'delete db'
Receipt.destroy_all
Item.destroy_all
User.destroy_all

p 'creating users'
5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: 'Test123'
  )
  p "Created user id: #{user.id}"
  p "creating items for user #{user.id}"
  2.times do
    item = Item.create!(
      item_name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price,
      user_id: user.id
    )
    p "Created item id: #{item.id}"
  end
end
