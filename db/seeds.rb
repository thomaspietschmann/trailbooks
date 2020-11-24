Accomodation.destroy_all
Trail.destroy_all

puts "Creating sample trails"
Trail.create(name: "Laugevagur Trail")
Trail.create(name: "Tour de Mont Blanc")

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
acc.trail = Trail.find_by(name: "Laugevagur Trail")
acc.save

acc = Accomodation.new(
  name: "Leeannas pumpkin cupcakes",
  description: "cold rooms but warm food",
  category: "Hotel",
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
acc.trail = Trail.find_by(name: "Laugevagur Trail")
acc.save

acc = Accomodation.new(
  name: "Landmannalaugar",
  description: "Nice place in the tundra",
  category: "Hotel",
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

acc.trail = Trail.find_by(name: "Laugevagur Trail")
acc.save

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

acc.trail = Trail.find_by(name: "Laugevagur Trail")
acc.save


acc = Accomodation.new(
  name: "Hotel Col de la Forclaz",
  description: "Food and more",
  category: "Hotel",
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

acc.trail = Trail.find_by(name: "Tour de Mont Blanc")
acc.save


acc = Accomodation.new(
  name: "Alpage",
  description: "Beautiful refugio on Mont Blanc",
  category: "Refugio",
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

acc.trail = Trail.find_by(name: "Tour de Mont Blanc")
acc.save


acc = Accomodation.new(
  name: "Refuge de Miage",
  description: "Beautiful refugio on Mont Blanc",
  category: "Refugio",
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

acc.trail = Trail.find_by(name: "Tour de Mont Blanc")
acc.save



puts "Done."
