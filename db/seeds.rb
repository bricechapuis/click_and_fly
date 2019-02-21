# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Generating Fake Database..."

User.create(
  email: 'yahya@fly.co',
  password: 'tititoto',
  name: 'Yahya Fallah',
  phone_number: 674309117)

User.create(
  email: 'benoit@fly.co',
  password: 'tititoto',
  name: 'Benoit Roualec',
  phone_number: 784562496)

User.create(
  email: 'guillaume@fly.co',
  password: 'tititoto',
  name: 'Guillaume Ecollan',
  phone_number: 615632734)

User.create(
  email: 'brice@fly.co',
  password: 'tititoto',
  name: 'Brice Chapuis',
  phone_number: 664248116)

10.times do
  User.create(
    email: Faker::Internet.email,
    password: 'tititoto',
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.cell_phone)
end

Plane.create(
  user: User.find_by_id(1),
  title: 'Great plane for business trips!',
  price: 5000,
  model: 'Dassault Falcon 2000',
  autonomy: 5797,
  pilot: true,
  description: 'It was a bit surprising when Dassault, a French company known for high standards of performance and technological advancement, announced that their next jet would be optimized for economy.  Fortunately, they managed to create the Falcon 2000 without sacrificing their usual high standard of excellence.  The Falcon 2000 is a private jet with a large cabin, transcontinental range, and fast cruise speeds.  It can easily complete nonstop flights such as trips from Miami to Seattle or from Boston to San Francisco.',
  capacity: 8,
  registration_number: 'N671WM',
  airfield: 'Aéroport de Paris - Le Bourget')

Plane.create(
  user: User.find_by_id(2),
  title: 'Great experience for aerobatic fans',
  price: 1500,
  model: 'Dassault/Dornier Alpha Jet',
  autonomy: 610,
  pilot: false,
  description: 'The Alpha Jet is a light twin-engine aircraft equipped with an intentionally simple airframe despite the performance delivered. Both the leading edges and air intakes are fixed; while the aerodynamic shape of the aircraft, which was developed with the aid of computer aided design (CAD), conforms with the area rule. Fully powered controls are used, comprising a dual-hydraulic systems and load-factor limited dynamic feel system arrangement attached to conventional flight control surfaces. The cockpit is pressurised for greater comfort during training. The Alpha Jet is designed to accommodate ten-minute turn around times with minimal ground equipment, using features such as pressurised single-point refueling, ladder-less entering/egress of the cockpit, and a ten-hour endurance of the liquid oxygen system.',
  capacity: 2,
  registration_number: '314-TR',
  airfield: 'Aérodrome de Lognes - Emerainville')

Plane.create(
  user: User.find_by_id(1),
  title: "For ol'times lovers :)",
  price: 1750,
  model: 'Messerschmitt Bf 109 E-3',
  autonomy: 1700,
  pilot: false,
  description: "The Messerschmitt Bf 109 is a German World War II fighter aircraft that was the backbone of the Luftwaffe's fighter force. The Bf 109 first saw operational service in 1937 during the Spanish Civil War and was still in service at the dawn of the jet age at the end of World War II in 1945. It was one of the most advanced fighters of the era, including such features as all-metal monocoque construction, a closed canopy, and retractable landing gear. It was powered by a liquid-cooled, inverted-V12 aero engine. From the end of 1941, the Bf 109 was steadily being supplemented by the Focke-Wulf Fw 190. It was commonly called the Me 109, most often by Allied aircrew and even among the German aces themselves, even though this was not the official German designation.",
  capacity: 1,
  registration_number: 'J-355',
  airfield: 'Aérodrome de Toussus-le-Noble')

Plane.create(
  user: User.find_by_id(3),
  title: 'A perfect plane for leisure week-ends',
  price: 1800,
  model: 'Cessna Citation Mustang ',
  autonomy: 2161,
  pilot: true,
  description: "The Cessna Mustang is similar in size to the CJ1, but does not inherit the basic design of the Citation fuselage and the Mustang cabin volume is slightly smaller than that of the CJ1. The diameter of the fuselage has been reduced, so the ergonomics cabin has not a perfectly circular cross-section, but an extended area in the legs and shoulders of the passengers. In the cabin, which has been finished on a qualitative level much more than in the Citation jets, which have been produced in recent years, there are 4 passenger seats opposite each other, tables can be arranged in the space between them. The cabins have oval-shaped windows and are located at the level of the passengers' eyes. Cabin length 2.97m. (Except cab), width 1.40m. and height 1.37m. Luggage compartment, which is not available to passengers during the flight, has a volume of 1.8 cubic meters.",
  capacity: 4,
  registration_number: 'C-FPCE',
  airfield: "Aérodrome de Saint-Cyr-l'École")

Plane.create(
  user: User.find_by_id(4),
  title: 'Awesome paper plane',
  price: 1,
  model: 'Oxford 21x29,7cm',
  autonomy: 0,
  pilot: false,
  description: "A paper plane, paper aeroplane (UK), paper airplane (US), paper glider, paper dart or dart is a toy aircraft, usually a glider made out of folded paper or paperboard.",
  capacity: 0,
  registration_number: 'Top Gun',
  airfield: 'Aéroport de Paris-Orly')

# 10.times do
#   Booking.create(
#     start_date: Faker::Date.forward(23),
#     end_date: Faker::Date.between(24.days.from_now, 25.days.from_now),
#     user_id: rand(0..9),
#     plane_id: rand(0..9))
# end

puts "Done!"
