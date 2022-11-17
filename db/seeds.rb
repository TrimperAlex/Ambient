# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# cleaning the DB
puts "cleaning the DB…"
puts " deleting weather_events"
WeatherEvent.destroy_all
puts " deleting users"
User.destroy_all

puts "creating 4 users"
user1 = User.create!(email: "suraj@ambient.com", password: "123456", first_name: "Suraj", last_name: "Gopal")
puts "user #{user1.id} created"
user2 = User.create!(email: "alex@ambient.com", password: "123456", first_name: "Alex", last_name: "Trimper")
puts "user #{user2.id} created"
user3 = User.create!(email: "nea@ambient.com", password: "123456", first_name: "Nea", last_name: "Noc")
puts "user #{user3.id} created"
user4 = User.create!(email: "helene@ambient.com", password: "123456", first_name: "Helene", last_name: "Buffet")
puts "user #{user4.id} created"

puts "now creating 4 weather_events…"
we1 = WeatherEvent.create!(description: "Summer shiny day", temperature: 30, category: "sun", image_url: "summer.jpg", price: 1000, owner_id: user1.id)
puts "weather_event #{we1.id} of user #{we1.owner.first_name} created"
we2 = WeatherEvent.create!(description: "Snowstorm Stay at home day", temperature: -10, category: "snow", image_url: "snow.jpg", price: 100, owner_id: user2.id)
puts "weather_event #{we2.id} of user #{we2.owner.first_name} created"
we3 = WeatherEvent.create!(description: "Lightning day", temperature: 25, category: "thunderstorm", image_url: "lightning.jpg", price: 50, owner_id: user3.id)
puts "weather_event #{we3.id} of user #{we3.owner.first_name} created"
we4 = WeatherEvent.create!(description: "Vancouver daily day", temperature: 10, category: "rain", image_url: "rain.jpg", price: 20, owner_id: user4.id)
puts "weather_event #{we4.id} of user #{we4.owner.first_name} created"

puts "Seeding all done!"
puts "Now we can test Github!"
