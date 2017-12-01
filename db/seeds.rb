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
       email: "mattia@gmail.com",
       first_name: "Mattia",
       last_name: "Lamouroux",
       description: "Je sais changer les couches",
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: true,
       photo: "https://avatars0.githubusercontent.com/u/31513010?s=460&v=4",
       cphoto: "",
       iban: Faker::Code.ean,
       address: "Montée de l'église Caluire"
     )
      nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
   User.create!(
       email: "christophe@gmail.com",
       first_name: "Christophe",
       last_name: "Gachet",
       description: "Je sais faire, j'en ai plein",
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: true,
       photo: "   https://avatars0.githubusercontent.com/u/32262781?v=4",
       cphoto: "",
       iban: Faker::Code.ean,
       address: "11 bis rue du Doupra Lyon"
     )
      nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
   User.create!(
       email: "tiphanie@gmail.com",
       first_name: "Tiphanie",
       last_name: "Tourniaire",
       description: "J'adore les enfants",
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: true,
       photo: "https://avatars2.githubusercontent.com/u/31669955?v=4",
       cphoto: "",
       iban: Faker::Code.ean,
       address: "59 place Voltaire Lyon"
     )
      nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
    User.create!(
       email: "laetitia@gmail.com",
       first_name: "Laetitia",
       last_name: "Ahamada",
       description: "Come baby come !",
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: true,
       photo: "https://avatars3.githubusercontent.com/u/32166166?v=4",
       cphoto: "",
       iban: Faker::Code.ean,
       address: "place Carnot Lyon"
     )
       nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
    User.create!(
       email: "greg@gmail.com",
       first_name: "Grégory",
       last_name: "Blain",
       description: "Disponible et sérieux",
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: true,
       photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/jmuqusfozwr7azb1qt46.jpg",
       cphoto: "",
       iban: Faker::Code.ean,
       address: "place Bellecour Lyon"
     )
       nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
        User.create!(
       email: "antoine@gmail.com",
       first_name: "Antoine",
       last_name: "Marmoux",
       description: "Comptez sur moi !",
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: true,
       photo: "https://avatars2.githubusercontent.com/u/31132825?v=4",
       cphoto: "",
       iban: Faker::Code.ean,
       address: "25 rue Sala Lyon"
     )
           nb = [1, 2, 3, 4].sample
   bab = [true, false].sample
    User.create!(
       email: "marc@gmail.com",
       first_name: "Marc",
       last_name: "Thiry",
       description: "Franchement j'envoie !",
       password: "azerty",
       number_of_kids: nb,
       babysitter: true,
       garde_a_domicile: true,
       photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/klcom1iv5qdcsbm8kz5s.jpg",
       cphoto: "",
       iban: Faker::Code.ean,
       address: "54 rue de la Charité Lyon"
     )


80.times do
  start_time = Faker::Time.between(DateTime.now - 10, DateTime.now  + 5)
  end_time = Faker::Time.between(DateTime.now - 10, DateTime.now + 5)
  if end_time > start_time
    availability = Reservation.new(
      start: start_time,
      end: end_time,
      parent_id: rand(1..7).to_i,
      babysitter_id: rand(1..7).to_i,
      number_of_kids: 2,
      confirm: false,
      pay: false
    )
  availability.save!
  end
end

p "c'est cool"

