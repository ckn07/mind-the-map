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
tour_eiffel = Poi.new(
  name: "Tour Eiffel",
  address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France",
  latitude: 48.858373,
  longitude: 2.29448,
  description: "Constructed from 1887–1889 as the entrance to the 1889 World's Fair, it was initially criticized by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognisable structures in the world. The Eiffel Tower is the most-visited paid monument in the world; 6.91 million people ascended it in 2015.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Eiffel_Tower")
tour_eiffel.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543932568/MtM/eiffel-tower.jpg"
tour_eiffel.save

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

grand_palais = Poi.new(
  name: "Grand Palais",
  address: "3 Avenue du Général Eisenhower, 75008 Paris",
  latitude: 48.8665777,
  longitude: 2.311635000000024,
  description: "The Grand Palais des Champs-Élysées, commonly known as the Grand Palais (English: Great Palace), is a large historic site, exhibition hall and museum complex located at the Champs-Élysées in the 8th arrondissement of Paris, France",
  scrapping_uri: "https://en.wikipedia.org/wiki/Grand_Palais")
grand_palais.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544020952/MtM/grand-palais.jpg"
grand_palais.save!

notre_dame = Poi.new(
  name: "Cathédrale Notre-Dame de Paris",
  address: "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris",
  latitude: 48.85296820000001,
  longitude: 2.3499021000000084,
  description: "Notre-Dame de Paris meaning also known as Notre-Dame Cathedral or simply Notre-Dame, is a medieval Catholic cathedral on the Île de la Cité in the fourth arrondissement of Paris",
  scrapping_uri: "https://en.wikipedia.org/wiki/Notre-Dame_de_Paris")
notre_dame.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544020952/MtM/notre-dame.jpg"
notre_dame.save!

sacre_coeur = Poi.new(
  name: "Basilique du Sacré-Cœur de Montmartre",
  address: "35 Rue du Chevalier de la Barre, 75018 Paris",
  latitude: 48.8870069,
  longitude: 2.342536500000051,
  description: "The Basilica of the Sacred Heart of Paris, commonly known as Sacré-Cœur Basilica and often simply Sacré-Cœur, is a Roman Catholic church and minor basilica, dedicated to the Sacred Heart of Jesus, in Paris, France. ",
  scrapping_uri: "https://en.wikipedia.org/wiki/Sacr%C3%A9-C%C5%93ur,_Paris")
sacre_coeur.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544020952/MtM/sacre-coeur.jpg"
sacre_coeur.save!

hotel_invalides = Poi.new(
  name: "Hôtel des Invalides",
  address: "Rond-Point du Bleuet de France, 75007 Paris",
  latitude: 48.8570915,
  longitude: 2.312811199999942,
  description: "Les Invalides, formally the Hôtel national des Invalides (The National Residence of the Invalids), or also as Hôtel des Invalides, is a complex of buildings in the 7th arrondissement of Paris, France, containing museums and monuments, all relating to the military history of France, as well as a hospital and a retirement home for war veterans, the building's original purpose",
  scrapping_uri: "https://en.wikipedia.org/wiki/Les_Invalides")
hotel_invalides.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544020951/MtM/hotel-invalides.jpg"
hotel_invalides.save!

pantheon = Poi.new(
  name: "Panthéon",
  address: "Place du Panthéon, 75005 Paris",
  latitude: 48.8463836,
  longitude: 2.3449622000000545,
  description: "The Panthéon is a building in the Latin Quarter in Paris, France. It was originally built as a church dedicated to St. Genevieve and to house the reliquary châsse containing her relics but, after many changes, now functions as a secular mausoleum containing the remains of distinguished French citizens",
  scrapping_uri: "https://en.wikipedia.org/wiki/Panth%C3%A9on")
pantheon.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544020953/MtM/pantheon.jpg"
pantheon.save!

louvre = Poi.new(
  name: "Musée du Louvre",
  address: "Rue de Rivoli, 75001 Paris",
  latitude: 48.8606111,
  longitude: 2.3376439999999548,
  description: "The Louvre or the Louvre Museum, is the world's largest art museum and a historic monument in Paris, France. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement (district or ward). Approximately 38,000 objects from prehistory to the 21st century are exhibited over an area of 72,735 square metres (782,910 square feet). In 2017, the Louvre was the world's most visited art museum, receiving 8.1 million visitors",
  scrapping_uri: "https://en.wikipedia.org/wiki/Louvre")
louvre.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543929617/MtM/louvre.jpg"
louvre.save!

palais_luxembourg = Poi.new(
  name: "Palais du Luxembourg",
  address: "15 Rue de Vaugirard, 75291 Paris",
  latitude: 48.84323500000001,
  longitude: 2.3136036999999305,
  description: "The Luxembourg Palace is located at 15 rue de Vaugirard in the 6th arrondissement of Paris. It was originally built (1615–1645) to the designs of the French architect Salomon de Brosse to be the royal residence of the regent Marie de' Medici, mother of Louis XIII of France.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Louvre")
palais_luxembourg.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544020952/MtM/palais_luxembourg.jpg"
palais_luxembourg.save!

puts "--> 10 pois have been created!"


# ThemePoi seed
puts "generating theme pois"
tp1 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: tour_eiffel.id)
tp1.save!

tp2 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: arc_triomphe.id)
tp2.save!

tp3 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: palais_garnier.id)
tp3.save!

tp4 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: grand_palais.id)
tp4.save!

tp5 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: notre_dame.id)
tp5.save!

tp6 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: sacre_coeur.id)
tp6.save!

tp7 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: hotel_invalides.id)
tp7.save!

tp8 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: pantheon.id)
tp8.save!

tp9 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: louvre.id)
tp9.save!

tp10 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: palais_luxembourg.id)
tp10.save!
puts "--> 3 theme pois have been created!"

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
  score: 100)
answer1.game = game1
answer1.poi = tour_eiffel
answer1.user = chris
answer1.save!

answer2 = Answer.new(
  time_to_respond: 2503,
  latitude: 48.873804,
  longitude: 2.295027,
  score: 200)
answer2.game = game1
answer2.poi = arc_triomphe
answer2.user = chris
answer2.save!

answer3 = Answer.new(
  time_to_respond: 33333,
  latitude: 48.871234,
  longitude: 2.332242,
  score: 300)
answer3.game = game1
answer3.poi = palais_garnier
answer3.user = chris
answer3.save!

answer4 = Answer.new(
  time_to_respond: 43333,
  latitude: 48.873423,
  longitude: 2.342536500331,
  score: 400)
answer4.game = game1
answer4.poi = grand_palais
answer4.user = chris
answer4.save!

answer5 = Answer.new(
  time_to_respond: 43533,
  latitude: 48.8712254,
  longitude: 2.334444,
  score: 500)
answer5.game = game1
answer5.poi = notre_dame
answer5.user = chris
answer5.save!

answer6 = Answer.new(
  time_to_respond: 45633,
  latitude: 48.874334,
  longitude: 2.3322222,
  score: 600)
answer6.game = game1
answer6.poi = sacre_coeur
answer6.user = chris
answer6.save!

answer7 = Answer.new(
  time_to_respond: 123233,
  latitude: 48.8713454,
  longitude: 2.3323443,
  score: 700)
answer7.game = game1
answer7.poi = hotel_invalides
answer7.user = chris
answer7.save!

answer8 = Answer.new(
  time_to_respond: 75643,
  latitude: 48.873274,
  longitude: 2.333642,
  score: 800)
answer8.game = game1
answer8.poi = pantheon
answer8.user = chris
answer8.save!

answer9 = Answer.new(
  time_to_respond: 56333,
  latitude: 48.871465,
  longitude: 2.332453,
  score: 900)
answer9.game = game1
answer9.poi = louvre
answer9.user = chris
answer9.save!

answer10 = Answer.new(
  time_to_respond: 347533,
  latitude: 48.874758,
  longitude: 2.3322454,
  score: 1000)
answer10.game = game1
answer10.poi = palais_luxembourg
answer10.user = chris
answer10.save!

puts "--> 10 answers have been created!"


