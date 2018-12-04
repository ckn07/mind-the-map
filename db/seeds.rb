# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database of cities...'
City.destroy_all
puts 'Cleaning database of themes...'
Theme.destroy_all
puts 'Cleaning database of theme pois...'
Theme_poi.destroy_all
puts 'Cleaning database of pois...'
Poi.destroy_all
puts 'Cleaning database of games...'
Game.destroy_all
puts 'Cleaning database of answers...'
Answer.destroy_all
puts 'Cleaning database of users...'
User.destroy_all

# User seed
puts 'generating users with password 123456 '
jeremy = User.new(email: "jeremy.jouffroy@gmail.com",
  password: "123456",
  username: "jerem",
  first_name: "Jeremy",
  last_name: "Jouffroy",
  address: "26 rue Edouard Vaillant, 93140 Bondy, France")
jeremy.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543927010/MtM/jeremy.jpg"
jeremy.save!

benoit = User.new(email: "benoitdelest@gmail.com",
  password: "123456",
  username: "ben",
  first_name: "Benoit",
  last_name: "Delest",
  address: "3 rue de la Joncquiere, 75017 Paris, France")
benoit.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543926966/MtM/benoit.png"
benoit.save!

cecile = User.new(email: "cecile.dezy@gmail.com",
  password: "123456",
  username: "cec",
  first_name: "Cécile",
  last_name: "Dezy",
  address: "6 rue Euryale Dehaynin, 75019 Paris, France ")
cecile.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543927335/MtM/cecile.jpg"
cecile.save!

chris = User.new(email: "christophe@noujaim.com",
  password: "123456",
  username: "chris",
  first_name: "Christophe",
  last_name: "Noujaim",
  address: "20 Boulevard de Clichy, 75018 Paris, France")
chris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543927010/MtM/jeremy.jpg"
chris.save!

# Cities seed
puts 'generating cities'
paris = City.new(name: 'Paris')
paris.remote_photo_url =
