# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'as-duration'


10.times do
  nb = [1, 2, 3, 4].sample
  bab = [true, false].sample

  User.create!(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraph,
      password: Faker::Internet.password,
      number_of_kids: nb,
      babysitter: bab,
      photo: "http://lorempixel.com/400/200/people",
      iban: Faker::Code.ean
    )
end


3.times do
  user_place = UserPlace.create!(
    name: Faker::Name.first_name,
    address:Faker::Address.street_address,
    photo: "http://www.book-a-flat.com/images/paris-salon-2.jpg",
    capacity: rand(1..5).to_i,
    price: rand(8..15).to_i,
    user_id: 1
    )
end

10.times do
  user_place = UserPlace.create!(
    name: Faker::Name.first_name,
    address:Faker::Address.street_address,
    photo: "http://www.book-a-flat.com/images/paris-salon-2.jpg",
    capacity: rand(1..5).to_i,
    price: rand(8..15).to_i,
    user_id: rand(1..10).to_i
    )
end


8.times do
  start_time = Faker::Time.forward(7, :all)
  end_time = Faker::Time.forward(7, :all)
  if end_time > start_time
    availability = Availability.new(
      start: start_time,
      end: end_time,
      user_place_id: 1
    )
  availability.save!
  end
end

80.times do
  start_time = Faker::Time.forward(7, :all)
  end_time = Faker::Time.forward(7, :all)
  if end_time > start_time
    availability = Availability.new(
      start: start_time,
      end: end_time,
      user_place_id: rand(1..10).to_i
    )
  availability.save!
  end
end

  Reservation.create!(
    user_place_id: 1,
    start: Faker::Time.forward(7, :all),
    end: Faker::Time.forward(7, :all),
    parent_id: 1,
    babysitter_id: 5,
    number_of_kids: 3
    )
