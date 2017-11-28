# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'as-duration'



100.times do
  start_time = Faker::Time.forward(7, :all)
  end_time = Faker::Time.forward(7, :all)
  if end_time > start_time
    availability = Availability.new(
      start: start_time
      end: end_time
      user_place_id: rand(1..10).to_i
    )
  availability.save!
  end
end
