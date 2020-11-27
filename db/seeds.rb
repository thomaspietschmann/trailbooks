Accomodation.destroy_all
TrailStage.destroy_all
Trail.destroy_all

puts "Seeding trails..."

def create_trail(input)
  p input
  puts "creating trail #{input[:name]}"
  trail = Trail.new(input)
  filename = "#{trail[:trail_outline]}.svg"
  file = File.open("./db/seed_img/outlines/#{filename}")
  trail.photos.attach(io: file, filename: filename, content_type: 'image/svg')
  trail.save!
  filename = "#{trail[:trail_outline]}.jpg"
  file = File.open("./db/seed_img/trail_bg/#{filename}")
  trail.photos.attach(io: file, filename: filename, content_type: 'image/jpg')
  trail.save!
end

trails = [
  {name: "Laugavegur Trail", country: "Iceland", distance: 55, number_of_days: "3-4", elevation_range: "219 - 1,057", trail_outline: "laugavegur"},
  {name: "Tour du Mont Blanc", country: "France, Italy, Switzerland", distance: 170, number_of_days: "9-11", elevation_range: "556 - 2,210", trail_outline: "tour-du-mont-blanc"},
  {name: "West Highland Way", country: "Scotland", distance: 154, number_of_days: "6-8", elevation_range: "5 - 548", trail_outline: "west-highland-way"},
  {name: "Milford track", country: "New Zealand", distance: 54, number_of_days: "4", elevation_range: "82 - 1,109", trail_outline: "milford-track"},
  {name: "Walker's Haute Route", country: "France, Switzerland", distance: 200, number_of_days: "10-15", elevation_range: "890 - 3,294", trail_outline: "walkers-haute-route"},
  {name: "GR20", country: "Corsica", distance: 180, number_of_days: "5-7", elevation_range: "41 - 1,197", trail_outline: "gr20"}
  ]

trails.each do |trail|
  create_trail(trail)
end

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

def attach_photos(acc)
  p acc.name
  filepath = "#{acc.name}"
  @images = Dir.glob("./db/seed_img/Accomodations/Laugavegur/#{acc.name}/*.jpg")
  @images.each do |image|
    p "Using #{acc.name} for upload..."
    file = File.open(image)
    acc.photos.attach(io: file, filename: image, content_type: 'image/jpeg')
    acc.save
  end
end

puts "adding sample accomodations to trail"
acc = Accomodation.new(
  name: "Landmannalaugar",
  description: "Landmannalaugar mark the beginning or end of a great many hikes in the Nature Reserve Fjallabak. Among other trails is the popular trail Laugavegur, that runs from Landmannalaugar to Þórsmörk.",
  category: "Campsite",
  toilets: false,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.9912415,
  longitude: -19.0600593,
  price_per_night: 39,
  capacity: 78
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Hrafntinnusker",
  description: "The Höskuldsskáli hut in Hrafntinnusker is operated by Ferðafélag Íslands (The Iceland Touring Association, FÍ) and accommodates 52 people. The hut sits right on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk and is often considered the first stop on the trail.",
  category: "Campsite",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: false,
  latitude: 63.9336295,
  longitude: -19.1707295,
  price_per_night: 39,
  capacity: 52
)
acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

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
  price_per_night: 39,
  capacity: 58
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Álftavatn",
  description: "The huts on lake Álftavatn are on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk, about half-way on the trail. Those who hike Laugavegurinn sometimes hike all the way to Álftavatn on the first day, others prefer to spend the first night in Hrafntinnusker and the second night in Álftavatn.",
  category: "Campsite",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.8576346,
  longitude: -19.2294162,
  price_per_night: 39,
  capacity: 72
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Hvanngil",
  description: "The hut in Hvanngil is on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk, a little bit further than half-way on the trail.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.8318,
  longitude: -19.2048,
  price_per_night: 39,
  capacity: 60
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Emstrur",
  description: "Ferðafélag Íslands (The Iceland Touring Association, FÍ) operates three small mountain huts in Botnar on Emstrur, right on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.854954,
  longitude: -19.248147,
  price_per_night: 39,
  capacity: 60
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Þórsmörk",
  description: "Þórsmörk is a true Icelandic treasure and very popular with outdoor enthusiasts, for both short and long hikes.

This is where the popular trail Laugavegur, from Landmannalaugar to Þórsmörk, ends and where another popular trail Fimmvörðuháls either ends or begins.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.6133,
  longitude: -19.6172,
  price_per_night: 39,
  capacity: 75
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)


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
