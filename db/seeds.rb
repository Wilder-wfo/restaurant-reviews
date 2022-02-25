# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating 50 Restaurants..."
50.times do
  restaurant = Restaurant.new(     # In Google-> to generate fake data- https://github.com › faker-ruby > faker
    name: Faker::Restaurant.name,   # In GitHub-> Faker::Restaurant and select Faker::Restaurant.name
    address: Faker::Address.street_name,   # In GitHub-> Faker::Address and select .street_name
    rating: (1..5).to_a.sample,   # method returns an array containing the numbers in the given range
    chef_name: Faker::Name.name   # In GitHub-> Faker::Name and select .name
  )
  restaurant.save!
  puts "Creamos restaurant con ID #{restaurant.id}"
end

# puts "Creating 50 Restaurants..."
# 50.times do
#   Restaurant.create!(     # In Google-> to generate fake data- https://github.com › faker-ruby > faker
#     name: Faker::Restaurant.name,   # In GitHub-> Faker::Restaurant and select Faker::Restaurant.name
#     address: Faker::Address.street_name,   # In GitHub-> Faker::Address and select .street_name
#     rating: (1..5).to_a.sample,   # method returns an array containing the numbers in the given range
#     chef_name: Faker::Name.name   # In GitHub-> Faker::Name and select .name
#   )
# end

# # Another way of seeding the DB
# # db/seeds.rb
# puts "Cleaning database..."
# Restaurant.destroy_all

# puts "Creating restaurants... dishoom and pizza_east"
# dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE", stars: 5 }
# pizza_east =  { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", stars: 4 }

# [ dishoom, pizza_east ].each do |attributes|
#   restaurant = Restaurant.create!(attributes)
#   puts "Created #{restaurant.name}"
# end
# puts "Finished!"
