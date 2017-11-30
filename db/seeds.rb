# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'as-duration'


   nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
   User.create!(
       email: "toto@gmail.com",
       first_name: "Toto",
       last_name: "nuris",
       description: Faker::Lorem.paragraph,
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: true,
       photo: "http://lorempixel.com/400/200/people",
       iban: Faker::Code.ean,
       address: "lyon 100 cours charlemagne"
     )

   nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
   User.create!(
       email: "tata@gmail.com",
       first_name: "Tata",
       last_name: "nuris",
       description: Faker::Lorem.paragraph,
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: false,
       photo: "http://lorempixel.com/400/200/people",
       iban: Faker::Code.ean,
       address: "lyon 20 cours charlemagne"
     )

   nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
   User.create!(
       email: "tutu@gmail.com",
       first_name: "Tutu",
       last_name: "nuris",
       description: Faker::Lorem.paragraph,
       password: "azerty",
       number_of_kids: nb,
       babysitter: false,
       garde_a_domicile: true,
       photo: "http://lorempixel.com/400/200/people",
       iban: Faker::Code.ean,
       address: "lyon 10 cours suchet"
     )


   nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
   User.create!(
       email: "tonton@gmail.com",
       first_name: "Tonton",
       last_name: "nuris",
       description: Faker::Lorem.paragraph,
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: true,
       photo: "http://lorempixel.com/400/200/people",
       iban: Faker::Code.ean,
       address: "lyon 2 rue ravat"
     )




# 100.times do
#   start_time = Faker::Time.forward(7, :all)
#   end_time = Faker::Time.forward(7, :all)
#   if end_time > start_time
#     availability = Availability.new(
#       start: start_time,
#       end: end_time,
#       user_place_id: rand(1..10).to_i
#     )
#   availability.save!
#   end
# end


