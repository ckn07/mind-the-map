# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database of theme pois...'
ThemePoi.destroy_all
puts 'Cleaning database of themes...'
Theme.destroy_all
puts 'Cleaning database of cities...'
City.destroy_all
puts 'Cleaning database of pois...'
Poi.destroy_all
puts 'Cleaning database of answers...'
Answer.destroy_all
puts 'Cleaning database of games...'
Game.destroy_all
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
jeremy.save

benoit = User.new(email: "benoitdelest@gmail.com",
  password: "123456",
  username: "ben",
  first_name: "Benoit",
  last_name: "Delest",
  address: "3 rue de la Jonquiere, 75017 Paris, France")
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

puts "--> 4 users have been created!"

# Cities seed
puts 'generating cities'

paris = City.new(name: 'Paris')
paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543927598/MtM/paris.jpg"
paris.save!

london = City.new(name: 'London')
london.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543927737/MtM/london.jpg"
london.save!

berlin = City.new(name: 'Berlin')
berlin.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543927894/MtM/berlin.jpg"
berlin.save!

puts "--> 3 cities have been created!"

# Themes seed
puts "generating themes"
monuments_paris = Theme.new(name: "Monuments")
monuments_paris.city = paris
monuments_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543929617/MtM/louvre.jpg"
monuments_paris.save!

puts "--> 1 theme has been created!"

# POI seed
puts "generating pois"
eiffel_tower = Poi.new(
  name: "Eiffel Tower",
  address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France",
  latitude: 48.858373,
  longitude: 2.29448,
  description: "Constructed from 1887–1889 as the entrance to the 1889 World's Fair, it was initially criticized by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognisable structures in the world.[3] The Eiffel Tower is the most-visited paid monument in the world; 6.91 million people ascended it in 2015.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Eiffel_Tower")
eiffel_tower.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543932568/MtM/eiffel-tower.jpg"
eiffel_tower.save!

arc_triomphe = Poi.new(
  name: "Arc de Triomphe",
  address: "Place Charles de Gaulle, 75008 Paris, France",
  latitude: 48.873804,
  longitude: 2.295027,
  description: "The Arc de Triomphe de l'Étoile is one of the most famous monuments in Paris, standing at the western end of the Champs-Élysées at the center of Place Charles de Gaulle, formerly named Place de l'Étoile — the étoile of the juncture formed by its twelve radiating avenues.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Arc_de_Triomphe")
arc_triomphe.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543932861/MtM/arc-triomphe.jpg"
arc_triomphe.save!

palais_garnier = Poi.new(
  name: "Palais Garnier",
  address: "10 Place de l'Opéra, 75009 Paris, France",
  latitude: 48.8708714,
  longitude: 2.3322167999999692,
  description: "The Palais Garnier is a 1,979-seat opera house, which was built from 1861 to 1875 for the Paris Opera. It was called the Salle des Capucines, because of its location on the Boulevard des Capucines in the 9th arrondissement of Paris, but soon became known as the Palais Garnier, in recognition of its opulence and its architect, Charles Garnier.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Palais_Garnier")
palais_garnier.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543933607/MtM/palais-garnier.jpg"
palais_garnier.save!

puts "--> 3 pois have been created!"

# Games seed
puts "generating games"
game1 = Game.new(
  user_one: chris,
  score_one: 1900,
  total_time_one: 44322)
game1.theme = monuments_paris

puts "--> 1 game has been created!"

# Answers seed
puts "generating answers"
answer1 = Answer.new(
  time_to_respond: 4000,
  latitude: 48.868213,
  longitude: 2.30448,
  score: 600)
answer1.game = game1
answer1.poi = eiffel_tower
answer1.user = chris
answer1.save!

answer2 = Answer.new(
  time_to_respond: 2503,
  latitude: 48.873804,
  longitude: 2.295027,
  score: 800)
answer2.game = game1
answer2.poi = arc_triomphe
answer2.user = chris
answer2.save!

answer3 = Answer.new(
  time_to_respond: 33333,
  latitude: 48.871234,
  longitude: 2.332242,
  score: 500)
answer3.game = game1
answer3.poi = palais_garnier
answer3.user = chris
answer3.save!

puts "--> 3 answers have been created!"


