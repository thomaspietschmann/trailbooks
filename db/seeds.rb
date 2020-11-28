Accomodation.destroy_all
TrailStage.destroy_all
Trail.destroy_all

# -------------------------- TRAILS -------------------------

puts "Seeding trails..."

def create_trail(input)
  puts "Creating #{input[:name]}"
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

puts "Trails seeded"


# -------------------------- ACCOMMODATION PHOTOS -------------------------


def attach_photo_and_save(acc)
  p acc.name
  filepath = "#{acc.name}"
  @images = Dir.glob("./db/seed_img/Accomodations/Tour du Mont Blanc/#{acc.name}/*.jpg")
  @images.each do |image|
    p "Using #{acc.name} for upload..."
    file = File.open(image)
    acc.photos.attach(io: file, filename: image, content_type: 'image/jpeg')
    acc.save
  end
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



# -------------------------- LAUGAVEGUR TRAIL -------------------------


puts "Seeding accommodations for Laugavegur Trail..."

acc = Accomodation.new(
  name: "Landmannalaugar Hut",
  description: "Landmannalaugar mark the beginning or end of a great many hikes in the Nature Reserve Fjallabak. Among other trails is the popular trail Laugavegur, that runs from Landmannalaugar to Þórsmörk.",
  category: "Hut",
  toilets: false,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.9912415,
  longitude: -19.0600593,
  price_per_night: 9500,
  capacity: 78
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Hrafntinnusker Hut",
  description: "The Höskuldsskáli hut in Hrafntinnusker is operated by Ferðafélag Íslands (The Iceland Touring Association, FÍ) and accommodates 52 people. The hut sits right on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk and is often considered the first stop on the trail.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: false,
  latitude: 63.9336295,
  longitude: -19.1707295,
  price_per_night: 9500,
  capacity: 52
)
acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Álftavatn Hut",
  description: "The huts on lake Álftavatn are on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk, about half-way on the trail. Those who hike Laugavegurinn sometimes hike all the way to Álftavatn on the first day, others prefer to spend the first night in Hrafntinnusker and the second night in Álftavatn.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.85939,
  longitude: -19.22692,
  price_per_night: 9500,
  capacity: 72
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Hvanngil Hut",
  description: "The hut in Hvanngil is on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk, a little bit further than half-way on the trail.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.83399,
  longitude: -19.20421,
  price_per_night: 9500,
  capacity: 60
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Emstrur Hut",
  description: "Ferðafélag Íslands (The Iceland Touring Association, FÍ) operates three small mountain huts in Botnar on Emstrur, right on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.76857,
  longitude: -19.37237,
  price_per_night: 9500,
  capacity: 60
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accomodation.new(
  name: "Þórsmörk Hut",
  description: "Þórsmörk is a true Icelandic treasure and very popular with outdoor enthusiasts, for both short and long hikes. This is where the popular trail Laugavegur, from Landmannalaugar to Þórsmörk, ends and where another popular trail Fimmvörðuháls either ends or begins.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.6860549,
  longitude: -19.5021758,
  price_per_night: 9500,
  capacity: 75
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

puts "Laugavegur Trail accommodations seeded."


laugavegur_stages=[
["Landmannalaugar",63.9909,-19.0612],
["Hrafntinnusker",63.9330,-19.1684],
["Álftavatn",63.8578,-19.2272 ],
["Emstrur",63.7663,-19.374],
["Þórsmörk",63.6807,-19.4826],
]

laugavegur_stages.each_with_index do |stage, index|
  trailstage = TrailStage.new(
    name: stage[0],
    stage_number: index + 1,
    latitude: stage[1],
    longitude: stage[2],
  )
  trailstage.trail = Trail.find_by(name: "Laugavegur Trail")

  trailstage.save!
end

puts "Trail stages seeded."


# ------------------------- TOUR DU MONT BLANC -------------------------


puts "Seeding Tour du Mont Blanc accommodations..."

acc = Accomodation.new(
  name: "Camping Bellevue",
  description: "Camping is available at the Bellevue Campsite which is located at the base of the cable car of the same name. This is your only camping option in Les Houches. The campground has basic bathroom facilities and places to charge electronics. Les Houches has several bars, restaurants, ATMs, a small outdoors store where you can purchase stove fuel, a post office, and a grocery store.  There is a bus that runs frequently to and from Chamonix, which has several outdoor retailers and shops that will provide you with anything you may have forgotten to pack.",
  category: "Campsite",
  toilets: true,
  showers: true,
  lunch_bag: false,
  breakfast: false,
  dinner: false,
  longitude: 6.788155,
  latitude: 45.89627,
  price_per_night: 12,
  capacity: 60
)

acc.trail = Trail.find_by(name: "Tour du Mont Blanc")
attach_photo_and_save(acc)


acc = Accomodation.new(
  name: "Camping Le Pontet",
  description: "At the end of stage one, most campers will prefer to pitch their tent at Camping Le Pontet, just past the town of Les Contamines. This is the traditional stopping point for this stage, and it gives you better access to services and amenities, both at the campground and in the nearby town.",
  category: "Campsite",
  toilets: true,
  showers: true,
  lunch_bag: false,
  breakfast: true,
  dinner: true,
  longitude: 6.72169,
  latitude: 45.80296,
  price_per_night: 11,
  capacity: 10
)

acc.trail = Trail.find_by(name: "Tour du Mont Blanc")
attach_photo_and_save(acc)


acc = Accomodation.new(
  name: "Les Chapieux Camping",
  description: "The tourist office, located in the center of the camping area, has bathrooms with sinks (cold water, potable) and toilets. There is a small shop across the road from the campsite that sells delicious local cheeses, snacks, and hiker basics like ramen noodles, trail mix, and some toiletries.  We recommend stocking up on foodstuffs in Chamonix or Les Houches to get you to this point, but the shop will meet your needs in a pinch.  Additionally, the Auberge de la Nova, just down the road from your campsite, is a nice option for drinks, snacks, or dinner.",
  category: "Campsite",
  toilets: true,
  showers: false,
  lunch_bag: false,
  breakfast: false,
  dinner: false,
  longitude: 6.73428,
  latitude: 45.69577,
  price_per_night: 0,
  capacity: 10
)

acc.trail = Trail.find_by(name: "Tour du Mont Blanc")
attach_photo_and_save(acc)

puts "Tour du Mont Blanc accommodations seeded."


puts "Seeding Tour du Mont Blanc trail stages..."

montblanc_stages=[
["Les Houches",45.89006,6.79824],
["Les Contamines",45.80732,6.72478],
["Les Chapieux",45.69751,6.73441],
["Rifugio Elisabetta",45.76700,6.83743],
["Courmayeur",45.79683,6.96797],
["Rifugio Bonatti",45.84692,7.03353],
["La Fouly",45.93312,7.09851],
["Champex",46.02969,7.11707],
["Col de la Forclaz",46.057766,7.001360],
["Tre le Champ",45.997076,6.926385],
["La Flegere",45.96000,6.88743]
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

puts "Tour du Mont Blanc trail stages seeded."
