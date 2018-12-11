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
monuments_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544020952/MtM/sacre-coeur.jpg"
monuments_paris.save!

districts_paris = Theme.new(name: "Districts")
districts_paris.city = paris
districts_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544094011/MtM/themes_paris/districts_paris.jpg"
districts_paris.save!

places_paris = Theme.new(name: "Places")
places_paris.city = paris
places_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544437736/MtM/Places_POIs/main_places.jpg"
places_paris.save!

shops_paris = Theme.new(name: "Shops")
shops_paris.city = paris
shops_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544094011/MtM/themes_paris/shops_paris.jpg"
shops_paris.save!

restaurants_paris = Theme.new(name: "Restaurants")
restaurants_paris.city = paris
restaurants_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544094011/MtM/themes_paris/restaurants_paris.jpg"
restaurants_paris.save!

concerts_paris = Theme.new(name: "Concerts")
concerts_paris.city = paris
concerts_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544094011/MtM/themes_paris/concerts_paris.jpg"
concerts_paris.save!

parks_paris = Theme.new(name: "Parks")
parks_paris.city = paris
parks_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544094011/MtM/themes_paris/parks_paris.jpg"
parks_paris.save!

museums_paris = Theme.new(name: "Museums")
museums_paris.city = paris
museums_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543929617/MtM/louvre.jpg"
museums_paris.save!

amelie_paris = Theme.new(name: "Find Amelie")
amelie_paris.city = paris
amelie_paris.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544094431/MtM/themes_paris/amelie_paris.jpg"
amelie_paris.save!

puts "--> 9 themes has been created!"


# POI seed
puts "generating pois for monuments_paris"
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
  name: "Basilique du Sacré-Cœur",
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

palais_luxembourg = Poi.new(
  name: "Palais du Luxembourg",
  address: "15 Rue de Vaugirard, 75291 Paris",
  latitude: 48.84323500000001,
  longitude: 2.3136036999999305,
  description: "The Luxembourg Palace is located at 15 rue de Vaugirard in the 6th arrondissement of Paris. It was originally built (1615–1645) to the designs of the French architect Salomon de Brosse to be the royal residence of the regent Marie de' Medici, mother of Louis XIII of France.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Louvre")
palais_luxembourg.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544020952/MtM/palais_luxembourg.jpg"
palais_luxembourg.save!

puts "--> 8 pois for monuments_paris have been created!"

puts "generating pois for districts_paris"

second_district = Poi.new(
  name: "2nd District",
  address: "121-119 Rue Réaumur, 75002 Paris",
  latitude: 48.868553,
  longitude: 2.342026,
  description: "The 2nd arrondissement of Paris (IIe arrondissement) is one of the 20 arrondissements of the capital city of France. In spoken French, this arrondissement is colloquially referred to as deuxième (second/the second). Also known as Bourse, this arrondissement is located on the right bank of the River Seine. The 2nd arrondissement, together with the adjacent 8th and 9th arrondissements, hosts an important business district, centred on the Paris Opéra, which houses the city's most dense concentration of business activities",
  scrapping_uri: "https://en.wikipedia.org/wiki/2nd_arrondissement_of_Paris")
second_district.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544434635/MtM/District_POIs/second_district.gif"
second_district.save!

ninth_district = Poi.new(
  name: "9th District",
  address: "52 Rue Saint-Georges, 75009 Paris",
  latitude: 48.877628,
  longitude: 2.337366,
  description: "The 9th arrondissement of Paris (IXe arrondissement) called Opéra, is located on the right bank of the River Seine. It contains many places of cultural, historical, and architectural interest, including the Palais Garnier, home to the Paris Opera, Boulevard Haussmann, and its large department stores Galeries Lafayette and Printemps. The arrondissement has many theaters including Folies Bergères, Théatre Mogador and Théatre de Paris. Along with the 2nd and 8th arrondissements, it hosts one of the business centers of Paris, located around the Opéra.",
  scrapping_uri: "https://en.wikipedia.org/wiki/9th_arrondissement_of_Paris")
ninth_district.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544434721/MtM/District_POIs/ninth_district.gif"
ninth_district.save!

sixth_district = Poi.new(
  name: "6th District",
  address: "2-6 Rue Servandoni, 75006 Paris",
  latitude: 48.850641,
  longitude: 2.334805,
  description: "The 6th arrondissement of Paris (VIe arrondissement)is called Luxembourg. It is situated on the left bank of the River Seine. It includes world-famous educational institutions such as the École des Beaux-Arts de Paris and the Académie française, the seat of the French Senate as well as a concentration of some of Paris's most famous monuments such as Saint-Germain Abbey and square, St. Sulpice Church and square, the Pont des Arts, and the Jardin du Luxembourg.",
  scrapping_uri: "https://en.wikipedia.org/wiki/6th_arrondissement_of_Paris")
sixth_district.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544435131/MtM/District_POIs/sixth_district.gif"
sixth_district.save!

eighteenth_district = Poi.new(
  name: "18th District",
  address: "Rue Ordener, 75018 Paris",
  latitude: 48.891761,
  longitude: 2.348130,
  description: "The 18th arrondissement of Paris (XVIIIe arrondissement) known as Butte-Montmartre, is located on the right bank of the River Seine. It is mostly known for hosting the district of Montmartre which contains a hill known for its artistic history, the Bateau-Lavoir where Pablo Picasso, George Braque, and Amedeo Modigliani lived and worked in early 20th century [1], the house of music diva Dalida, the Moulin Rouge cabaret, other historic features, and the prominent Sacré Cœur basilica which sits atop the hill.",
  scrapping_uri: "https://en.wikipedia.org/wiki/18th_arrondissement_of_Paris")
eighteenth_district.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544436295/MtM/District_POIs/eighteenth_district.gif"
eighteenth_district.save!

twentieth_district = Poi.new(
  name: "20th District",
  address: "6 Rue du Capitaine Ferber, 75020 Paris",
  latitude: 48.864617,
  longitude: 2.404677,
  description: "The 20th (or XXe or vingtième) arrondissement of Paris is the last of the consecutively numbered arrondissements of that French capital city. Also known as Ménilmontant, it is located on the right bank of the River Seine and contains the city's cosmopolitan districts Ménilmontant and Belleville. The 20th arrondissement is also internationally known for the Père Lachaise Cemetery where one can find the tombs of many famous artists",
  scrapping_uri: "https://en.wikipedia.org/wiki/20th_arrondissement_of_Paris")
twentieth_district.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544437005/MtM/District_POIs/twentieth_district.gif"
twentieth_district.save!

puts "--> 5 pois have been created for districts_paris !"

puts "generating pois for places_paris"

place_vosges = Poi.new(
  name: "Place des Vosges",
  address: "Place des Vosges, 75004 Paris",
  latitude: 48.85561140000001,
  longitude: 2.3655266000000665,
  description: "The Place des Vosges, originally Place Royale, is the oldest planned square in Paris, France. It is located in the Marais district, and it straddles the dividing-line between the 3rd and 4th arrondissements of Paris. It was a fashionable and expensive square to live in during the 17th and 18th centuries, and one of the central reasons of the fashionable nature of Le Marais for the Parisian nobility.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Place_des_Vosges")
place_vosges.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544437736/MtM/Places_POIs/main_places.jpg"
place_vosges.save!

place_republique = Poi.new(
  name: "Place de la République",
  address: "Place de la République, Paris, France",
  latitude: 48.86739360000001,
  longitude: 2.3634144000000106,
  description: "The Place de la République (formerly known as the Place du Château d'Eau) is a square in Paris, located on the border between the 3rd, 10th and 11th arrondissements. The square has an area of 3.4 ha (8.4 acres).[2] It is named after the French Republic, was called the Place du Château-d'Eau until 1879, and contains a monument which includes a statue of the personification of France, Marianne.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Place_de_la_R%C3%A9publique")
place_republique.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544438384/MtM/Places_POIs/republique_place.jpg"
place_republique.save!

place_concorde = Poi.new(
  name: "Place de la Concorde",
  address: "Place de la Concorde, 75008 Paris, France",
  latitude: 48.8655759,
  longitude: 2.3206268000000136,
  description: "The Place de la Concorde (French pronunciation: ​[plas də la kɔ̃kɔʁd]) is one of the major public squares in Paris, France. Measuring 18.8 acres (7.6 hectares) in area, it is the largest square in the French capital. It is located in the city's eighth arrondissement, at the eastern end of the Champs-Élysées. It was the site of many notable public executions during the French Revolution.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Place_de_la_Concorde")
place_concorde.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544438534/MtM/Places_POIs/concorde_place.jpg"
place_concorde.save!

place_trocadero = Poi.new(
  name: "Place du Trocadero",
  address: "Place du Trocadéro et du 11 Novembre 1918, 75016 Paris, France",
  latitude: 48.8626979,
  longitude: 2.287502600000039,
  description: "The Trocadéro is an area of Paris, France, in the 16th arrondissement, across the Seine from the Eiffel Tower. The hill of the Trocadéro is the hill of Chaillot, a former village.The place was named in honour of the Battle of Trocadero, in which the fortified Isla del Trocadero, in southern Spain, was captured by French forces led by the Duc d'Angoulême, son of the future King of France, Charles X, on August 31, 1823.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Trocad%C3%A9ro")
place_trocadero.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544442517/MtM/Places_POIs/trocadero_place.jpg"
place_trocadero.save!


place_vendome = Poi.new(
  name: "Place Vendome",
  address: "Place Vendôme, 75001 Paris",
  latitude: 48.8675839,
  longitude: 2.3293456000000106,
  description: "Place Vendôme is a square in the 1st arrondissement of Paris, France, located to the north of the Tuileries Gardens and east of the Église de la Madeleine. It is the starting point of the rue de la Paix. Its regular architecture by Jules Hardouin-Mansart and pedimented screens canted across the corners give the rectangular place Vendôme the aspect of an octagon. The original Vendôme Column at the centre of the square was erected by Napoleon I to commemorate the Battle of Austerlitz; it was torn down on 16 May 1871, by decree of the Paris Commune, but subsequently re-erected and remains a prominent feature on the square today.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Place_Vend%C3%B4me")
place_vendome.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544442053/MtM/Places_POIs/vendome_place.jpg"
place_vendome.save!

puts "--> 5 pois have been created for places_paris !"

puts "generating pois for shops_paris"

galeries_lafayette_shop = Poi.new(
  name: "Les Galeries Lafayette Haussmann",
  address: "40 Boulevard Haussmann, Paris, France",
  latitude: 48.8675839,
  longitude: 2.3293456000000106,
  description: "The Galeries Lafayette is an upmarket French department store chain. Its flagship store is on Boulevard Haussmann in the 9th arrondissement of Paris but it now operates in a number of other locations in France and other countries. In 2009, Galeries Lafayette recorded earnings of over one billion euro. It is a part of the company Groupe Galeries Lafayette.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Galeries_Lafayette")
galeries_lafayette_shop.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544443129/MtM/Shops_POIs/galeries_lafayette.jpg"
galeries_lafayette_shop.save!

bhv_shop = Poi.new(
  name: "Le BHV",
  address: "52 Rue de Rivoli, 75004 Paris",
  latitude: 48.85731229999999,
  longitude: 2.3536331000000246,
  description: "The Bazar de l'Hôtel de Ville or Le BHV Marais is a department store on rue de Rivoli in the 4th arrondissement of Paris, facing the Hôtel de Ville. It is part of the Groupe Galeries Lafayette and served by the Metro station Hôtel de Ville. It occupies four other smaller specialized stores, in the neighborhood, and has also opened several other shops in France and in Beirut, Lebanon. BHV currently operates several stores in the Paris metropolitan area and two in the Lyon metropolitan area.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Bazar_de_l%27H%C3%B4tel_de_Ville")
bhv_shop.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544443129/MtM/Shops_POIs/bhv.jpg"
bhv_shop.save!

printemps_haussmann_shop = Poi.new(
  name: "Printemps Paris Haussmann",
  address: "64 Boulevard Haussmann, 75009 Paris, France",
  latitude: 48.8739784,
  longitude: 2.3280558000000156,
  description: "Printemps (meaning 'spring' in French) is a French department store chain (French: grand magasin, literally 'big store'). The Printemps stores focus on beauty, lifestyle, fashion, accessories, and men's wear.Printemps was founded in 1865 by Jules Jaluzot and Jean-Alfred Duclos. The original store was designed by noted architects Jules and Paul Sédille and opened at the corner of Le Havre and Boulevard Haussmann in Paris, France, on 3 November 1865. The building was greatly expanded in 1874, and elevators (then a great novelty) from the 1867 Universal Exposition were installed.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Printemps")
printemps_haussmann_shop.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544443129/MtM/Shops_POIs/printemps.jpg"
printemps_haussmann_shop.save!

bon_marche_shop = Poi.new(
  name: "Le Bon Marché",
  address: "24 Rue de Sèvres, 75007 Paris",
  latitude: 48.8510258,
  longitude: 2.324509199999966,
  description: "Le Bon Marché (lit. 'the good market', or 'the good deal' in French) is a department store in Paris. Founded in 1838 and revamped almost completely by Aristide Boucicaut in 1852, it was the first ever modern department store. Now the property of LVMH, it sells a wide range of high-end goods, including food in an adjacent building at 38, rue de Sèvres, called La Grande Épicerie de Paris.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Le_Bon_March%C3%A9")
bon_marche_shop.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544443130/MtM/Shops_POIs/bon_marche%CC%81.jpg"
bon_marche_shop.save!

la_garconniere_shop = Poi.new(
  name: "La Garçonnière",
  address: "47 Rue des Archives, 75003 Paris",
  latitude: 48.86055289999999,
  longitude: 2.3570899000000054,
  description: "A casual shop for men made by men.",
  scrapping_uri: "https://www.la-garconniere.fr/")
la_garconniere_shop.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544443130/MtM/Shops_POIs/garc%CC%A7onnie%CC%80re_paris.jpg"
la_garconniere_shop.save!

puts "--> 5 pois have been created for shops_paris !"

puts "generating pois for restaurants_paris"

mokonuts_restaurants = Poi.new(
  name: "Mokonuts",
  address: "5 Rue Saint-Bernard, 75011 Paris, France",
  latitude: 48.8507906,
  longitude: 2.3813834000000043,
  description: "Opened in December 2015, Mokonuts is the brainchild of Moko and Omar, partners who previously spent decades working in other fields. Moko, a former lawyer, prepares original and delicious desserts that catch your eye as soon as you walk in, including cookies made with black olives and white chocolate. Her pecan cake is also divine, made with halva (a type of nougat) and muscovado sugar. Meanwhile, Omar handles the savoury side of the business, crafting stunning recipes using the freshest of ingredients, like a parsnip velouté with fiore sardo (an Italian cheese) and artichoke caponata. With its affordable prices and tempting flavours, the café has already become one of the hottest spots in the neighbourhood. ",
  scrapping_uri: "https://www.timeout.com/paris/en/restaurants/mokonuts")
mokonuts_restaurants.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544445613/MtM/Restaurants_POIs/mokonuts.jpg"
mokonuts_restaurants.save!

le_975_restaurant = Poi.new(
  name: "Le 975",
  address: "25 Rue Guy Môquet Paris 75017",
  latitude: 48.8507906,
  longitude: 2.3813834000000043,
  description: "Who’s it for? Those who love French cooking, with a penchant for Japanese flavours. What should I order? Iberian confit pork with spices, homemade mashed potatoes and rocket. When should I go? For the unbeatable lunchtime menu – €16 for a mise en bouche, the dish of the day, coffee and sweets.",
  scrapping_uri: "https://www.timeout.com/paris/en/restaurants/le-975")
le_975_restaurant.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544445833/MtM/Restaurants_POIs/975.jpg"
le_975_restaurant.save!

le_tagine_restaurant = Poi.new(
  name: "Le Tagine",
  address: "64 Boulevard Haussmann, 75009 Paris, France",
  latitude: 48.8642046,
  longitude: 2.36799910000002,
  description: "Truly the best couscous in Paris.With its pleated fabric ceiling, giant mirrors, mosaic-topped tables, and lanterns and candles throughout, Le Tagine sets the right scene for what we reckon is the best couscous in the city. ",
  scrapping_uri: "https://www.timeout.com/paris/en/restaurants/le-tagine")
le_tagine_restaurant.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544446006/MtM/Restaurants_POIs/le_tagine.jpg"
le_tagine_restaurant.save!

le_meurice_restaurant = Poi.new(
  name: "Le Meurice",
  address: "228 Rue de Rivoli, 75001 Paris, France",
  latitude: 48.86533259999999,
  longitude: 2.3281374000000596,
  description: "Anyone wanting a grand-slam experience of Gallic gastronomic grandeur won't do better than the glamorous dining room at the Hotel Meurice in the heart of the city. Though it was redecorated by Philippe Starck several years ago, it's good French bones survived intact – mosaic floor, crystal chandeliers, heavy damask curtains at the windows overlooking the Tuileries Gardens across the street – and the magnificent space is animated by old-school but friendly service that's as precise as a minuette. Chef Yannick Alléno bagged a third Michelin star in 2007, and his brilliantly inventive cooking is based on a deep knowledge of classical Escoffier vintage culinary technique",
  scrapping_uri: "https://www.theguardian.com/travel/2011/may/06/top-10-paris-restaurants-dining")
le_meurice_restaurant.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544446256/MtM/Restaurants_POIs/Meurice.jpg"
le_meurice_restaurant.save!

le_jules_verne_restaurant = Poi.new(
  name: "Le Jules Verne",
  address: "Avenue Gustave Eiffel, 75007 Paris",
  latitude: 48.85796189999999,
  longitude: 2.2954187000000275,
  description: "Located at the second level of the Eiffel Tower, Le Jules Verne offers a contemporary cuisine, reuniting all the basics of classic French cuisine. Created from a rigorous selection of quality ingredients from our regions, it reflects the quest of excellence dear to Alain Ducasse. Beyond the spectacular view upon Paris, the elegant space created by interior designer Patrick Jouin, is an invitation to the dream. In daytime, natural light pours throughout the restaurant. In the evening, the atmosphere becomes more muted, more sensual.",
  scrapping_uri: "https://en.parisinfo.com/paris-restaurant/70615/Le-Jules-Verne")
le_jules_verne_restaurant.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544446499/MtM/Restaurants_POIs/le-Jules-Verne.jpg"
le_jules_verne_restaurant.save!

puts "--> 5 pois have been created for restaurants_paris !"

puts "generating pois for concerts_paris"

philharmonie_concert = Poi.new(
  name: "Philharmonie de Paris",
  address: "221 Avenue Jean Jaurès, 75019 Paris, France",
  latitude: 48.8893059,
  longitude: 2.3938068999999587,
  description: "The Philharmonie de Paris is a cultural institution in Paris, France which combine spaces all dedicated to music. It is composed of concert halls, exhibition spaces, rehearsal rooms, educational services, restaurant and bars. The main buildings are all located in the Parc de la Villette at the northeastern edge of Paris in the 19th arrondissement. At the core of this set of spaces is the symphonic concert hall of 2,400 seats designed by Jean Nouvel and opened in January 2015",
  scrapping_uri: "https://en.wikipedia.org/wiki/Philharmonie_de_Paris")
philharmonie_concert.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544447144/MtM/Concerts_POIs/philharmonie_paris.jpg"
philharmonie_concert.save!

olympia_concert = Poi.new(
  name: "L'Olympia",
  address: "28 Boulevard des Capucines, 75009 Paris, France",
  latitude: 48.8702198,
  longitude: 2.3283343000000514,
  description: "The Olympia Bruno Coquatrix (commonly known as Olympia, or in English-speaking world as Olympia Hall and Paris Olympia) is a concert venue in the 9th arrondissement of Paris, France, located at 28 Boulevard des Capucines, equally distancing Madeleine church and Opéra Garnier, 300 metres (980 ft) north of Vendôme square. Its closest métro/RER stations are Madeleine, Opéra, Havre – Caumartin and Auber.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Olympia_(Paris)")
olympia_concert.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544447285/MtM/Concerts_POIs/olympia.jpg"
olympia_concert.save!

elysee_montmartre_concert = Poi.new(
  name: "L'Elysée Montmatre",
  address: "72 Boulevard de Rochechouart, 75018 Paris",
  latitude: 48.88301370000001,
  longitude: 2.3436626999999817,
  description: "Élysée Montmartre is a music venue located at 72 Boulevard de Rochechouart, Paris, France. It opened in 1807, burned down in 2011, reopened in 2016, and has a capacity of 1,380 patrons. The nearest métro station is Anvers.",
  scrapping_uri: "https://en.wikipedia.org/wiki/%C3%89lys%C3%A9e_Montmartre")
elysee_montmartre_concert.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544447473/MtM/Concerts_POIs/elysee_montmartre.jpg"
elysee_montmartre_concert.save!

pleyel_concert = Poi.new(
  name: "Salle Pleyel",
  address: "252 Rue du Faubourg Saint-Honoré, 75008 Paris, France",
  latitude: 48.8770488,
  longitude: 2.3009389000000056,
  description: "The Salle Pleyel (French: Pleyel Hall) is a concert hall in the 8th arrondissement of Paris, France. Its varied programme includes contemporary and popular music. Until 2015, the hall was a major venue for classical orchestral music, with Orchestre de Paris and the Orchestre Philharmonique de Radio France as resident ensembles.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Salle_Pleyel")
pleyel_concert.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544447537/MtM/Concerts_POIs/pleyel.jpg"
pleyel_concert.save!

bataclan_concert = Poi.new(
  name: "Le Bataclan",
  address: "50 Boulevard Voltaire, 75011 Paris, France",
  latitude: 48.863063,
  longitude: 2.3708149999999932,
  description: "The Bataclan is a theatre located at 50 Boulevard Voltaire in the 11th arrondissement of Paris, France. Designed in 1864 by the architect Charles Duval, its name refers to Ba-ta-clan, an operetta by Jacques Offenbach. Since the early 1970s, it has been a venue for rock music.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Bataclan_(theatre)")
bataclan_concert.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544447806/MtM/Concerts_POIs/Bataclan.jpg"
bataclan_concert.save!

puts "--> 5 pois have been created for concerts_paris !"

puts "generating pois for parks_paris"

buttes_chaumont_park = Poi.new(
  name: "Parc des Buttes Chaumont",
  address: "21 Rue Botzaris, 75019 Paris",
  latitude: 48.8769129,
  longitude: 2.381104599999958,
  description: "The Parc des Buttes-Chaumont is a public park situated in northeastern Paris, in the 19th arrondissement. Occupying 24.7 hectares (61 acres), it is the fifth-largest park in Paris, after the Bois de Vincennes, the Bois de Boulogne, the Parc de la Villette and the Tuileries Garden.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Parc_des_Buttes_Chaumont")
buttes_chaumont_park.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544448888/MtM/Parks_POIs/buttes_chaumont.jpg"
buttes_chaumont_park.save!

tuileries_park = Poi.new(
  name: "Jardin des Tuileries",
  address: "113 Rue de Rivoli, 75001 Paris",
  latitude: 48.8634916,
  longitude: 2.327494300000012,
  description: "The Tuileries Garden is a public garden located between the Louvre and the Place de la Concorde in the 1st arrondissement of Paris, France. Created by Catherine de' Medici as the garden of the Tuileries Palace in 1564, it was eventually opened to the public in 1667 and became a public park after the French Revolution. In the 19th and 20th centuries, it was a place where Parisians celebrated, met, strolled and relaxed.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Tuileries_Garden")
tuileries_park.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544448888/MtM/Parks_POIs/jardin_tuileries.jpg"
tuileries_park.save!

jardin_luxembourg_park = Poi.new(
  name: "Le Jardin du Luxembourg",
  address: "Le Jardin du Luxembourg, 75006 Paris, France",
  latitude: 48.8462217,
  longitude: 2.3371604999999818,
  description: "The Jardin du Luxembourg, also known in English as the Luxembourg Gardens, is located in the 6th arrondissement of Paris, France. It was created beginning in 1612 by Marie de' Medici, the widow of King Henry IV of France, for a new residence she constructed, the Luxembourg Palace. The garden today is owned by the French Senate, which meets in the Palace. It covers 23 hectares and is known for its lawns, tree-lined promenades, flowerbeds, model sailboats on its circular basin, and picturesque Medici Fountain, built in 1620. The name Luxembourg comes from the Latin Mons Lucotitius, the name of the hill where the garden is located",
  scrapping_uri: "https://en.wikipedia.org/wiki/Jardin_du_Luxembourg")
jardin_luxembourg_park.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544448888/MtM/Parks_POIs/luxembourg.jpg"
jardin_luxembourg_park.save!

champs_de_mars_park = Poi.new(
  name: "Champs de Mars",
  address: "Champ de Mars - Tour Eiffel 75015 Paris, France",
  latitude: 48.8551624,
  longitude: 2.2892107000000124,
  description: "The Champ de Mars (English: Field of Mars) is a large public greenspace in Paris, France, located in the seventh arrondissement, between the Eiffel Tower to the northwest and the École Militaire to the southeast. The park is named after the Campus Martius ('Mars Field') in Rome, a tribute to the Latin name of the Roman God of war. The name also alludes to the fact that the lawns here were formerly used as drilling and marching grounds by the French military.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Champ_de_Mars")
champs_de_mars_park.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544448888/MtM/Parks_POIs/champs_de_mars.jpg"
champs_de_mars_park.save!

parc_monceau = Poi.new(
  name: "Parc Monceau",
  address: "35 Boulevard de Courcelles, 75008 Paris",
  latitude: 48.863063,
  longitude: 2.3708149999999932,
  description: "Parc Monceau is a public park situated in the 8th arrondissement of Paris, France, at the junction of Boulevard de Courcelles, Rue de Prony and Rue Georges Berger. At the main entrance is a rotunda. The park covers an area of 8.2 hectares (20.3 acres).",
  scrapping_uri: "https://en.wikipedia.org/wiki/Parc_Monceau")
parc_monceau.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544448888/MtM/Parks_POIs/parc_monceau.jpg"
parc_monceau.save!

puts "--> 5 pois have been created for parks_paris !"

puts "generating pois for museums_paris"

louvre_museum = Poi.new(
  name: "Musée du Louvre",
  address: "Rue de Rivoli, 75001 Paris",
  latitude: 48.8606111,
  longitude: 2.3376439999999548,
  description: "The Louvre or the Louvre Museum, is the world's largest art museum and a historic monument in Paris, France. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement (district or ward). Approximately 38,000 objects from prehistory to the 21st century are exhibited over an area of 72,735 square metres (782,910 square feet). In 2017, the Louvre was the world's most visited art museum, receiving 8.1 million visitors",
  scrapping_uri: "https://en.wikipedia.org/wiki/Louvre")
louvre_museum.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1543929617/MtM/louvre.jpg"
louvre_museum.save!

grand_palais_museum = Poi.new(
  name: "Grand Palais",
  address: "3 Avenue du Général Eisenhower, 75008 Paris",
  latitude: 48.8665777,
  longitude: 2.311635000000024,
  description: "The Grand Palais des Champs-Élysées, commonly known as the Grand Palais (English: Great Palace), is a large historic site, exhibition hall and museum complex located at the Champs-Élysées in the 8th arrondissement of Paris, France",
  scrapping_uri: "https://en.wikipedia.org/wiki/Grand_Palais")
grand_palais_museum.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544020952/MtM/grand-palais.jpg"
grand_palais_museum.save!

orsay_museum = Poi.new(
  name: "Musée d'Orsay",
  address: "1 Rue de la Légion d'Honneur, 75007 Paris",
  latitude: 48.8601715,
  longitude: 2.3260740000000624,
  description: "The Musée d'Orsay is a museum in Paris, France, on the Left Bank of the Seine. It is housed in the former Gare d'Orsay, a Beaux-Arts railway station built between 1898 and 1900. The museum holds mainly French art dating from 1848 to 1914, including paintings, sculptures, furniture, and photography. It houses the largest collection of impressionist and post-Impressionist masterpieces in the world, by painters including Monet, Manet, Degas, Renoir, Cézanne, Seurat, Sisley, Gauguin, and Van Gogh.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Mus%C3%A9e_d%27Orsay")
orsay_museum.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544450401/MtM/Museums_POIs/orsay.jpg"
orsay_museum.save!

pompidou_museum = Poi.new(
  name: "Centre Georges Pompidou",
  address: "Place Georges-Pompidou, 75004 Paris",
  latitude: 48.8608613,
  longitude: 2.351717000000008,
  description: "Centre Georges Pompidou, commonly shortened to Centre Pompidou and also known as the Pompidou Centre in English, is a complex building in the Beaubourg area of the 4th arrondissement of Paris, near Les Halles, rue Montorgueil, and the Marais. It was designed in the style of high-tech architecture by the architectural team of Richard Rogers and Renzo Piano, along with Gianfranco Franchini.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Centre_Georges_Pompidou")
pompidou_museum.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544450401/MtM/Museums_POIs/Pompidou_center.jpg"
pompidou_museum.save!

picasso_museum = Poi.new(
  name: "Musée Picasso",
  address: "5 Rue de Thorigny, 75003 Paris",
  latitude: 48.8598015,
  longitude: 2.362448699999959,
  description: "The Musée Picasso is an art gallery located in the Hôtel Salé in rue de Thorigny, in the Marais district of Paris, France, dedicated to the work of the Spanish artist Pablo Picasso (1881–1973). The museum collection includes more than 5,000 works of art (paintings, sculptures, drawings, ceramics, prints, engravings and notebooks) and tens of thousands of archived pieces from Picasso’s personal repository, including the artist's photographic archive, personal papers, correspondence, and author manuscripts. A large portion of items were donated by Picasso’s family after his death, in accord with the wishes of the artist, who lived in France from 1905 to 1973",
  scrapping_uri: "https://en.wikipedia.org/wiki/picasso_museum")
picasso_museum.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544450401/MtM/Museums_POIs/picasso.jpg"
picasso_museum.save!

puts "--> 5 pois have been created for museums_paris !"

puts "generating pois for amelie_poulain_paris"

cafe_amelie_poulain = Poi.new(
  name: "the café where Amélie works",
  address: "15, rue Lepic, 75018 Paris",
  latitude: 48.8849297,
  longitude: 2.333737700000029,
  description: "The Café des 2 Moulins is a café in the Montmartre area of Paris, located at the junction of Rue Lepic and Rue Cauchois (the address is 15, rue Lepic, 75018 Paris). It takes its name from the two nearby historical windmills, Moulin Rouge and Moulin de la Galette.[1] The interior consists of a bar area and multiple small tables. The café has gained considerable fame since its appearance in the 2001 film Amélie, in which it is the workplace of the title character. It has since become a popular tourist destination.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Caf%C3%A9_des_2_Moulins")
cafe_amelie_poulain.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544452611/MtM/Amelie_Poulain_POIs/les_2_moulins.jpg"
cafe_amelie_poulain.save!

canal_amelie_poulain = Poi.new(
  name: "the canal where Amélie used to take a walk",
  address: "47 Quai de Valmy, 75010 Paris",
  latitude: 48.8699725,
  longitude: 2.3657894000000397,
  description: "Amelie loves to walk accross the Canal Saint-Martin. It is a 4.6 km (2.86 mi) long canal in Paris, connecting the Canal de l'Ourcq to the river Seine. Over nearly half its length (2069 m), between the Rue du Faubourg du Temple and the Place de la Bastille, was covered in the mid-19th century to create wide boulevards and public spaces on the surface",
  scrapping_uri: "https://fr.wikipedia.org/wiki/Canal_Saint-Martin")
canal_amelie_poulain.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544452611/MtM/Amelie_Poulain_POIs/canal.jpg"
canal_amelie_poulain.save!

collignon_amelie_poulain = Poi.new(
  name: "grocery where Lucien works ",
  address: "56 Rue des Trois Frères, 75018 Paris, France",
  latitude: 48.88567839999999,
  longitude: 2.338389300000017,
  description: "Collignon, crêpe chignon ! Collignon, face de fion ! Collignon, tête à gnons ! ",
  scrapping_uri: "https://www.tripadvisor.fr/Restaurant_Review-g187147-d10321552-Reviews-Au_Marche_De_La_Butte-Paris_Ile_de_France.html")
collignon_amelie_poulain.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544452611/MtM/Amelie_Poulain_POIs/epicerie_amelie.jpg"
collignon_amelie_poulain.save!

abbesses_amelie_poulain = Poi.new(
  name: "subway station where Amélie lives",
  address: "15 Rue des Abbesses, 75018 Paris, France",
  latitude: 48.88414150000001,
  longitude: 2.338446500000032,
  description: "Abbesses is a station on Paris Métro Line 12, in the Montmartre district and the 18th arrondissement. Abbesses is the deepest station in the Paris Métro, at 36 metres (118 feet)[1] below ground, it is located on the western side of the butte (hill) of Montmartre.",
  scrapping_uri: "https://en.wikipedia.org/wiki/Abbesses_(Paris_M%C3%A9tro)")
abbesses_amelie_poulain.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544452611/MtM/Amelie_Poulain_POIs/abbesses.jpg"
abbesses_amelie_poulain.save!

mask_zorro_amelie_poulain = Poi.new(
  name: "shop where Amélie bought her zorro mask",
  address: "11 Boulevard Saint-Martin, 75003 Paris",
  latitude: 48.8679676,
  longitude: 2.360940199999959,
  description: "A simple mask can change some lives.",
  scrapping_uri: "https://en.wikipedia.org/wiki/mask_zorro_amelie_poulain")
mask_zorro_amelie_poulain.remote_photo_url = "https://res.cloudinary.com/cecile-dzy-ncl/image/upload/v1544452611/MtM/Amelie_Poulain_POIs/ame%CC%81lie_poulain.gif"
mask_zorro_amelie_poulain.save!

puts "--> 5 pois have been created for amelie_poulain_paris !"

# ThemePoi seed
puts "generating theme pois for monuments_paris"
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
  poi_id: notre_dame.id)
tp4.save!

tp5 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: sacre_coeur.id)
tp5.save!

tp6 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: hotel_invalides.id)
tp6.save!

tp7 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: pantheon.id)
tp7.save!

tp8 = ThemePoi.new(
  theme_id: monuments_paris.id,
  poi_id: palais_luxembourg.id)
tp8.save!

puts "--> 8 theme pois have been created for monuments_paris!"

puts "--> let's start district_paris POIs!"

tp11 = ThemePoi.new(
  theme_id: districts_paris.id,
  poi_id: second_district.id)
tp11.save!

tp12 = ThemePoi.new(
  theme_id: districts_paris.id,
  poi_id: ninth_district.id)
tp12.save!

tp13 = ThemePoi.new(
  theme_id: districts_paris.id,
  poi_id: sixth_district.id)
tp13.save!

tp14 = ThemePoi.new(
  theme_id: districts_paris.id,
  poi_id: eighteenth_district.id)
tp14.save!

tp15 = ThemePoi.new(
  theme_id: districts_paris.id,
  poi_id: twentieth_district.id)
tp15.save!

puts "--> Ok for district_paris POIs "

puts "go for places_paris POIs"

tp11 = ThemePoi.new(
  theme_id: places_paris.id,
  poi_id: place_vosges.id)
tp11.save!

tp12 = ThemePoi.new(
  theme_id: places_paris.id,
  poi_id: place_republique.id)
tp12.save!

tp13 = ThemePoi.new(
  theme_id: places_paris.id,
  poi_id: place_concorde.id)
tp13.save!

tp14 = ThemePoi.new(
  theme_id: places_paris.id,
  poi_id: place_trocadero.id)
tp14.save!

tp15 = ThemePoi.new(
  theme_id: places_paris.id,
  poi_id: place_vendome.id)
tp15.save!

puts "--> good for district_paris POIs !"

puts "go for shops_paris POIs"

tp16 = ThemePoi.new(
  theme_id: shops_paris.id,
  poi_id: galeries_lafayette_shop.id)
tp16.save!

tp17 = ThemePoi.new(
  theme_id: shops_paris.id,
  poi_id: bhv_shop.id)
tp17.save!

tp18 = ThemePoi.new(
  theme_id: shops_paris.id,
  poi_id: bon_marche_shop.id)
tp18.save!

tp19 = ThemePoi.new(
  theme_id: shops_paris.id,
  poi_id: printemps_haussmann_shop.id)
tp19.save!

tp20 = ThemePoi.new(
  theme_id: shops_paris.id,
  poi_id: la_garconniere_shop.id)
tp20.save!

puts "--> good for shops_paris POIs!"

puts "go for restaurants_paris POIs"

tp21 = ThemePoi.new(
  theme_id: restaurants_paris.id,
  poi_id: mokonuts_restaurants.id)
tp21.save!

tp22 = ThemePoi.new(
  theme_id: restaurants_paris.id,
  poi_id: le_975_restaurant.id)
tp22.save!

tp23 = ThemePoi.new(
  theme_id: restaurants_paris.id,
  poi_id: le_tagine_restaurant.id)
tp23.save!

tp24 = ThemePoi.new(
  theme_id: restaurants_paris.id,
  poi_id: le_meurice_restaurant.id)
tp24.save!

tp25 = ThemePoi.new(
  theme_id: restaurants_paris.id,
  poi_id: le_jules_verne_restaurant.id)
tp25.save!

puts "--> good for restaurants_paris POIs!"

puts "go for concerts_paris POIs"

tp26 = ThemePoi.new(
  theme_id: concerts_paris.id,
  poi_id: philharmonie_concert.id)
tp26.save!

tp27 = ThemePoi.new(
  theme_id: concerts_paris.id,
  poi_id: pleyel_concert.id)
tp27.save!

tp28 = ThemePoi.new(
  theme_id: concerts_paris.id,
  poi_id: elysee_montmartre_concert.id)
tp28.save!

tp29 = ThemePoi.new(
  theme_id: concerts_paris.id,
  poi_id: olympia_concert.id)
tp29.save!

tp30 = ThemePoi.new(
  theme_id: concerts_paris.id,
  poi_id: bataclan_concert.id)
tp30.save!

puts "--> good for concerts_paris POIs!"

puts "go for parks_paris POIs"

tp31 = ThemePoi.new(
  theme_id: parks_paris.id,
  poi_id: jardin_luxembourg_park.id)
tp31.save!

tp32 = ThemePoi.new(
  theme_id: parks_paris.id,
  poi_id: tuileries_park.id)
tp32.save!

tp33 = ThemePoi.new(
  theme_id: parks_paris.id,
  poi_id: parc_monceau.id)
tp33.save!

tp34 = ThemePoi.new(
  theme_id: parks_paris.id,
  poi_id: buttes_chaumont_park.id)
tp34.save!

tp35 = ThemePoi.new(
  theme_id: parks_paris.id,
  poi_id: champs_de_mars_park.id)
tp35.save!

puts "--> good for parks_paris POIs!"

puts "go for museums_paris POIs"

tp36 = ThemePoi.new(
  theme_id: museums_paris.id,
  poi_id: louvre_museum.id)
tp36.save!

tp37 = ThemePoi.new(
  theme_id: museums_paris.id,
  poi_id: grand_palais_museum.id)
tp37.save!

tp38 = ThemePoi.new(
  theme_id: museums_paris.id,
  poi_id: orsay_museum.id)
tp38.save!

tp39 = ThemePoi.new(
  theme_id: museums_paris.id,
  poi_id: pompidou_museum.id)
tp39.save!

tp40 = ThemePoi.new(
  theme_id: museums_paris.id,
  poi_id: picasso_museum.id)
tp40.save!

puts "--> good for museums_paris POIs!"

puts "go for amelie_paris POIs"

tp41 = ThemePoi.new(
  theme_id: amelie_paris.id,
  poi_id: cafe_amelie_poulain.id)
tp41.save!

tp42 = ThemePoi.new(
  theme_id: amelie_paris.id,
  poi_id: abbesses_amelie_poulain.id)
tp42.save!

tp43 = ThemePoi.new(
  theme_id: amelie_paris.id,
  poi_id: canal_amelie_poulain.id)
tp43.save!

tp44 = ThemePoi.new(
  theme_id: amelie_paris.id,
  poi_id: mask_zorro_amelie_poulain.id)
tp44.save!

tp45 = ThemePoi.new(
  theme_id: amelie_paris.id,
  poi_id: collignon_amelie_poulain.id)
tp45.save!

puts "--> good for amelie_paris POIs!"


# Games seed
puts "generating games"
game1 = Game.new(
  user_one: chris,
  score_one: 1900,
  total_time_one: 44322)
game1.theme = monuments_paris
game1.save!

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

answer10 = Answer.new(
  time_to_respond: 347533,
  latitude: 48.874758,
  longitude: 2.3322454,
  score: 1000)
answer10.game = game1
answer10.poi = palais_luxembourg
answer10.user = chris
answer10.save!

puts "--> 8 answers have been created!"


