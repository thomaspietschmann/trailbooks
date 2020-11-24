Accomodation.destroy_all
Trail.destroy_all

puts "Creating sample trail"
Trail.create(name: "Laugevagur Trail")

puts "adding 2 sample accomodations to trail"
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
  price_per_night: 29,
  capacity: 10
)
acc.trail = Trail.find_by(name: "Laugevagur Trail")
acc.save

puts "Done."
