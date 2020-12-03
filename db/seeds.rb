Accommodation.destroy_all
TrailStage.destroy_all
Trail.destroy_all

# ------------------------------- TRAILS ---------------------------------

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
  ["Laugavegur Trail", "Iceland", 55, "3-4", "219 - 1,057", "laugavegur"],
  ["Tour du Mont Blanc", "France, Italy, Switzerland", 170, "9-11", "556 - 2,210", "tour-du-mont-blanc"],
  ["West Highland Way", "Scotland", 154, "6-8", "5 - 548", "west-highland-way"],
  ["Milford Track", "New Zealand", 54, "4", "82 - 1,109", "milford-track"],
  ["Walker's Haute Route", "France, Switzerland", 200, "10-15", "890 - 3,294", "walkers-haute-route"],
  ["GR20", "Corsica", 180, "5-7", "41 - 1,197", "gr20"]
]

trails.each do |trail|
  create_trail({
    name: trail[0],
    country: trail[1],
    distance: trail[2],
    number_of_days: trail[3],
    elevation_range: trail[4],
    trail_outline: trail[5]
  })
end

# -------------------------- ACCOMMODATION PHOTOS ------------------------------


def attach_photo_and_save(acc)
  puts acc.name
  filepath = "#{acc.name}"
  @images = Dir.glob("./db/seed_img/Accommodations/Tour du Mont Blanc/#{acc.name}/*.jpg")
  @images.each do |image|
    puts "Uploading images for #{acc.name}"
    file = File.open(image)
    acc.photos.attach(io: file, filename: image, content_type: 'image/jpeg')
    acc.save
  end
end

def attach_photos(acc)
  puts acc.name
  filepath = "#{acc.name}"
  @images = Dir.glob("./db/seed_img/Accommodations/Laugavegur/#{acc.name}/*.jpg")
  @images.each do |image|
    puts "Uploading images for #{acc.name}"
    file = File.open(image)
    acc.photos.attach(io: file, filename: image, content_type: 'image/jpeg')
    acc.save
  end
end



# -------------------------- LAUGAVEGUR TRAIL -------------------------


acc = Accommodation.new(
  name: "Landmannalaugar Hut",
  description: "Landmannalaugar mark the beginning or end of a great many hikes in the Nature Reserve Fjallabak. Among other trails is the popular trail Laugavegur, that runs from Landmannalaugar to Þórsmörk.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: true,
  dinner: true,
  latitude: 63.99124,
  longitude: -19.06005,
  price_per_night: 9500,
  capacity: 78
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accommodation.new(
  name: "Landmannalaugar Camping",
  description: "The camping area is located close to the toilet house and is mostly on gravel. It is extremely difficult to drive the pegs into the ground and if it is windy, rocks have to be used to weigh the tents down. People are kindly asked to return the rocks to the wooden crates after use.",
  category: "Campsite",
  toilets: true,
  showers: true,
  lunch_bag: false,
  breakfast: false,
  dinner: false,
  latitude: 63.99134,
  longitude: -19.06105,
  price_per_night: 500,
  capacity: 150
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accommodation.new(
  name: "Hrafntinnusker Hut",
  description: "The Höskuldsskáli hut in Hrafntinnusker is operated by Ferðafélag Íslands (The Iceland Touring Association, FÍ) and accommodates 52 people. The hut sits right on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk and is often considered the first stop on the trail.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: true,
  dinner: true,
  latitude: 63.9336295,
  longitude: -19.1707295,
  price_per_night: 9500,
  capacity: 52
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accommodation.new(
  name: "Álftavatn Hut",
  description: "The huts on lake Álftavatn are on the popular trail Laugavegur, from Landmannalaugar to Þórsmörk, about half-way on the trail. Those who hike Laugavegurinn sometimes hike all the way to Álftavatn on the first day, others prefer to spend the first night in Hrafntinnusker and the second night in Álftavatn.",
  category: "Hut",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: true,
  dinner: true,
  latitude: 63.85939,
  longitude: -19.22692,
  price_per_night: 9500,
  capacity: 72
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accommodation.new(
  name: "Álftavatn Camping",
  description: "The showers (accessible for a fee) are also located in the toilet house. There is also a small hut for the wardens. The camping ground is big. There is a winter latrine located a short distance from the toilet house. Please note, everyone that is not staying the night either at the huts or at the campsite is required to pay a facility fee for the usage of the bathrooms and outdoor facilities such as grill and benches.",
  category: "Campsite",
  toilets: true,
  showers: true,
  lunch_bag: false,
  breakfast: false,
  dinner: false,
  latitude: 63.85929,
  longitude: -19.22592,
  price_per_night: 500,
  capacity: 72
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accommodation.new(
  name: "Hvanngil Hut",
  description: "The hut is on two floors. On the ground floor, there is a big entrance, a small kitchen and two dormitories with double bunk beds and tables and chairs. The loft has two sleeping quarters with sleeping bag accommodation on mattresses. The kitchen is equipped with gas stoves, utensils and running cold water. There is a charcoal grill on the patio outside. There is a small hut for the wardens close by as well as a toilet house with showers (accessible for a fee). Further away there is a stable with kitchen facilities and a loft where 20 people can sleep. By the stable, there is a toilet and a camping ground.",
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

acc = Accommodation.new(
  name: "Hvanngil Camping",
  description: "There is another and quite special camping ground by the main hut. The camping is more or less inside a lava field where one can find good shelter if the weather is bad.",
  category: "Campsite",
  toilets: true,
  showers: false,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.84399,
  longitude: -19.21421,
  price_per_night: 9500,
  capacity: 100
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accommodation.new(
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

acc = Accommodation.new(
  name: "Emstrur Camping",
  description: "Behind the huts and in a tiny valley below them is a small camping ground. The toilet house is jointly used by the huts and the camping ground. The showers (accessible for a fee) are also located in the toilet house.",
  category: "Campsite",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.75857,
  longitude: -19.34237,
  price_per_night: 9500,
  capacity: 100
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)

acc = Accommodation.new(
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


acc = Accommodation.new(
  name: "Þórsmörk Camping",
  description: "Þórsmörk is a true Icelandic treasure and very popular with outdoor enthusiasts, for both short and long hikes. This is where the popular trail Laugavegur, from Landmannalaugar to Þórsmörk, ends and where another popular trail Fimmvörðuháls either ends or begins.",
  category: "Campsite",
  toilets: true,
  showers: true,
  lunch_bag: true,
  breakfast: false,
  dinner: true,
  latitude: 63.68905,
  longitude: -19.51217,
  price_per_night: 9500,
  capacity: 75
)

acc.trail = Trail.find_by(name: "Laugavegur Trail")
attach_photos(acc)


laugavegur_stages=[
  ["Landmannalaugar",63.9909,-19.0612, 0, 0, 0],
  ["Hrafntinnusker",63.9330,-19.1684, 12, 470, 245],
  ["Álftavatn",63.8578,-19.2272, 12, 564, 125],
  ["Emstrur",63.7663,-19.374, 16, 112, 643],
  ["Þórsmörk",63.6807,-19.4826, 15, 58, 245],
]

laugavegur_stages.each_with_index do |stage, index|
  trailstage = TrailStage.new(
    stage_number: index,
    name: stage[0],
    latitude: stage[1],
    longitude: stage[2],
    distance_from_last: stage[3],
    ascend_from_last: stage[4],
    descend_from_last: stage[5]
  )
  trailstage.trail = Trail.find_by(name: "Laugavegur Trail")
  trailstage.save!
end


# ------------------------- TOUR DU MONT BLANC -------------------------


acc = Accommodation.new(
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


acc = Accommodation.new(
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


acc = Accommodation.new(
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

montblanc_stages=[
  ["Les Houches",45.89006,6.79824, 0, 0, 0],
  ["Les Contamines",45.80732,6.72478, 16, 646, 633],
  ["Les Chapieux",45.69751,6.73441, 18, 1316, 929],
  ["Rifugio Elisabetta",45.76700,6.83743, 15, 1004, 258],
  ["Courmayeur",45.79683,6.96797, 18, 460, 1560],
  ["Rifugio Bonatti",45.84692,7.03353, 12, 860, 101],
  ["La Fouly",45.93312,7.09851, 20, 895, 1410],
  ["Champex",46.02969,7.11707, 15, 420, 565],
  ["Col de la Forclaz",46.057766,7.001360, 16, 742, 682],
  ["Tre le Champ",45.997076,6.926385, 13, 1069, 1178],
  ["La Flegere",45.96000,6.88743, 8, 733, 257],
  ["Les Houches",45.89636, 6.80487, 17, 772, 1546]
]

montblanc_stages.each_with_index do |stage, index|
  trailstage = TrailStage.new(
    stage_number: index,
    name: stage[0],
    latitude: stage[1],
    longitude: stage[2],
    distance_from_last: stage[3],
    ascend_from_last: stage[4],
    descend_from_last: stage[5]
  )
  trailstage.trail = Trail.find_by(name: "Tour du Mont Blanc")
  trailstage.save!
end

