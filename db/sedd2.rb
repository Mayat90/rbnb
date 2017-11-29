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
