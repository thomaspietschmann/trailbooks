Accomodation.destroy_all
Trail.destroy_all
TrailStage.destroy_all

puts "Seeding trails..."

Trail.create(name: "Laugavegur Trail", country: "Iceland", distance: 55, number_of_days: "3 - 4", elevation_range: "219 - 1057")
Trail.create(name: "Tour du Mont Blanc", country: "France, Italy, Switzerland", distance: 170, number_of_days: "9-11")
Trail.create(name: "West Highland Way", country: "Scotland", distance: 154, number_of_days: "6-8")
Trail.create(name: "Milford track", country: "New Zealand", distance: 54, number_of_days: "4")
Trail.create(name: "Walker's Haute Route", country: "France, Switzerland", distance: 200, number_of_days: "10-15")
Trail.create(name: "GR20", country: "Corsica", distance: 180, number_of_days: "5-7")

puts "We have trails!"


def attach_photo_and_save(acc)
  p acc.category
  if acc.category == "Campsite"
    filepath = "campsites"
  elsif acc.category == "Hut"
    filepath = "huts"
  end
  filename = "camp.jpeg"
  filepath = Dir.glob("./db/seed_img/#{filepath}/*.jpeg").sample
  p "Using #{filepath} for upload..."
  file = File.open(filepath)
    acc.photos.attach(io: file, filename: filename, content_type: 'image/jpeg')
acc.save
end

puts "adding sample accomodations to trail"
acc = Accomodation.new(
  name: "Briz's Diner ",
  description: "Best french goat cheese burgers on the trail",
  category: "Campsite",
  toilets: false,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  longitude: -19.199657598054117,
  latitude: 63.903805365540606,
  price_per_night: 29,
  capacity: 10
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
5.times do
  attach_photo_and_save(acc)
end

acc = Accomodation.new(
  name: "Leeannas pumpkin cupcakes",
  description: "cold rooms but warm food",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: false,
  longitude: -19.69320997666168,
  latitude: 63.55723515942712,
  price_per_night: 34,
  capacity: 10
)
acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photo_and_save(acc)

acc = Accomodation.new(
  name: "Landmannalaugar",
  description: "Nice place in the tundra",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  longitude: -19.06006,
  latitude: 63.99061,
  price_per_night: 58,
  capacity: 10
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photo_and_save(acc)

acc = Accomodation.new(
  name: "Volcano Huts",
  description: "Nice place in the tundra",
  category: "Campsite",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  longitude: -19.5406675,
  latitude: 63.691125,
  price_per_night: 16,
  capacity: 10
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photo_and_save(acc)


acc = Accomodation.new(
  name: "Hut Col de la Forclaz",
  description: "Food and more",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  longitude: 7.00127,
  latitude: 46.05839,
  price_per_night: 43,
  capacity: 10
)

acc.trail = Trail.find_by(name: "Tour du Mont Blanc")
attach_photo_and_save(acc)


acc = Accomodation.new(
  name: "Alpage",
  description: "Beautiful refugio on Mont Blanc",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  longitude: 7.11574,
  latitude: 45.90522,
  price_per_night: 11,
  capacity: 10
)

acc.trail = Trail.find_by(name: "Tour du Mont Blanc")
attach_photo_and_save(acc)


acc = Accomodation.new(
  name: "Refuge de Miage",
  description: "Beautiful refugio on Mont Blanc",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  longitude: 6.75991,
  latitude: 45.83925,
  price_per_night: 99,
  capacity: 10
)

acc.trail = Trail.find_by(name: "Tour du Mont Blanc")
attach_photo_and_save(acc)

montblanc_stages=[
["Les Chapieux",45.69751,6.73441],
["Rifugio Elisabetta",45.76700,6.83743],
["Courmayeur",45.79683,6.96797],
["Rifugio Bonatti",45.84692,7.03353],
["La Fouly",45.93312,7.09851],
["Champex",46.02969,7.11707],
["Col de la Forclaz",46.057766,7.001360],
["Tre le Champ",45.997076,6.926385],
["Refuge la Flegere",45.96000,6.88743],
["Les Houches",45.89006,6.79824],
["Les Contamines",45.80732,6.72478]
]

montblanc_stages.each_with_index do |stage, index|
  trailstage = TrailStage.new(
    name: stage[0],
    stage_number: index + 1,
    latitude: stage[1],
    longitude: stage[2],
  )
  trailstage.trail = Trail.find_by(name: "Tour du Mont Blanc")

  trailstage.save!

end


puts "Done."
