# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Generating Fake Database..."

10.times do
  User.create(
    email: Faker::Internet.email,
    password: 'tititoto',
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.cell_phone)
end

10.times do
	Plane.create(
		user: User.find_by_id(rand(0..9)),
		title: Faker::FunnyName.name,
		price: Faker::Number.number(4),
		autonomy: Faker::Number.number(4),
		model: Faker::Vehicle.model,
		pilot: true,
		description: Faker::Lorem.paragraph(2, true),
		capacity: Faker::Number.number(3),
		registration_number: Faker::Vehicle.license_plate,
		airfield: Faker::Address.street_address)
end

10.times do
  Booking.create(
    start_date: Faker::Date.forward(23),
    end_date: Faker::Date.between(24.days.from_now, 25.days.from_now),
    user_id: rand(0..9),
    plane_id: rand(0..9))
end

puts "Done!"
