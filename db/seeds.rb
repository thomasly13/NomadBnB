# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    require "open-uri"
    require "faker"

    ran = Random.new();
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Listing.destroy_all
    Reservation.destroy_all
    Review.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('listings')
    ApplicationRecord.connection.reset_pk_sequence!('reservations')
    ApplicationRecord.connection.reset_pk_sequence!('reviews')
  
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
      first_name: 'Demo', 
      last_name: 'Lition', 
      email: 'demo@user.com', 
      password: 'password'
    )
  
    # More users
    30.times do 
      User.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email,
        password: 'password'
      }) 
    end

 
    puts 'Creating listings...'

    listing_1 = Listing.create!(
      name: 'Luxury Beach View Apartment' ,
      description: 'Just a short stroll from beautiful LindaMar Beach, this large private spacious studio is perfect for your next beach getaway. It has a breathtaking unobstructed  ocean view which can be seen from anywhere in the unit, including the bathroom and shower. Surfboard rental is included with your stay offering a bonus activity for your trip! There is a huge private deck with a wraparound bench, lounge chairs, and a sunbed for your enjoyment while starring at one of the nicest ocean views in California' ,
      price: 194,
      address: "223 Stanley Ave, Pacifica, California, 94044",
      coordinates: '37.59493551449619 -122.51057679479852',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 2,
      num_of_baths: 1, 
      num_of_bedrooms: 1,
      num_of_beds: 1,
      owner_id: 1
    );
    
    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-1.jpeg"), 
      filename: "listing1-1.jpeg"
    )

    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-2.jpg"), 
      filename: "listing1-2.jpg"
    )

    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-3.jpeg"), 
      filename: "listing1-3.jpeg"
    )
    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-4.jpg"), 
      filename: "listing1-4.jpg"
    )
    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-5.jpeg"), 
      filename: "listing1-5.jpg"
    )
    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-6.jpeg"), 
      filename: "listing1-6.jpg"
    )
 


    listing_2 = Listing.create!(
      name: 'Coastal Chic: Central Parkside Hideaway' ,
      description: 'Relax in a safe, quiet, friendly neighborhood on your trip to San Francisco in the Parkside/Sunset district. Very safe and family-friendly neighborhood, close to Ocean Beach, Golden Gate Park, local restaurants, and malls. Perfect for families, trips with friends, or business travelers looking to work, relax, and explore San Francisco. Plenty of street parking, easy access to public transportation (29 and L Muni line), and plenty of Uber/Lyft options to get around the city as well!' ,
      price: 380,
      address: "2570 33rd Ave, San Francisco, California, 94116",
      coordinates: '37.73926211417792 -122.49023506458762',
      amenities: "Wifi Kitchen TV Parking",
      num_of_guests: 8,
      num_of_baths: 1, 
      num_of_bedrooms: 3,
      num_of_beds: 4,
      owner_id: 2
    )

    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-1.jpeg"), 
      filename: "listing2-1.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-2.jpeg"), 
      filename: "listing2-2.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-3.jpeg"), 
      filename: "listing2-3.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-4.jpeg"), 
      filename: "listing2-4.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-5.jpeg"), 
      filename: "listing2-5.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-6.jpeg"), 
      filename: "listing2-6.jpg"
    )



    listing_3 = Listing.create!(
      name: 'Luxury Beach View Apartment' ,
      description: 'Just a short stroll from beautiful LindaMar Beach, this large private spacious studio is perfect for your next beach getaway. It has a breathtaking unobstructed  ocean view which can be seen from anywhere in the unit, including the bathroom and shower. Surfboard rental is included with your stay offering a bonus activity for your trip! There is a huge private deck with a wraparound bench, lounge chairs, and a sunbed for your enjoyment while starring at one of the nicest ocean views in California' ,
      price: 194,
      address: "223 Stanley Ave, Pacifica, California, 94044",
      coordinates: '37.59493551449619 -122.51057679479852',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 2,
      num_of_baths: 1, 
      num_of_bedrooms: 1,
      num_of_beds: 1,
      owner_id: 3
    );

    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-1.jpeg"), 
      filename: "listing3-1.jpg"
    )
    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-2.jpg"), 
      filename: "listing3-2.jpg"
    )
    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-3.jpeg"), 
      filename: "listing3-3.jpg"
    )
    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-4.jpg"), 
      filename: "listing3-4.jpg"
    )
    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-5.jpeg"), 
      filename: "listing3-5.jpg"
    )
    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-6.jpeg"), 
      filename: "listing3-6.jpg"
    )

    listing_4 = Listing.create!(
      name: 'Luxury Beach View Apartment' ,
      description: 'Just a short stroll from beautiful LindaMar Beach, this large private spacious studio is perfect for your next beach getaway. It has a breathtaking unobstructed  ocean view which can be seen from anywhere in the unit, including the bathroom and shower. Surfboard rental is included with your stay offering a bonus activity for your trip! There is a huge private deck with a wraparound bench, lounge chairs, and a sunbed for your enjoyment while starring at one of the nicest ocean views in California' ,
      price: 194,
      address: "223 Stanley Ave, Pacifica, California, 94044",
      coordinates: '37.59493551449619 -122.51057679479852',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 2,
      num_of_baths: 1, 
      num_of_bedrooms: 1,
      num_of_beds: 1,
      owner_id: 4
    );

    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-1.jpeg"), 
      filename: "listing4-1.jpg"
    )
    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-2.jpg"), 
      filename: "listing4-2.jpg"
    )
    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-3.jpeg"), 
      filename: "listing4-3.jpg"
    )
    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-4.jpg"), 
      filename: "listing4-4.jpg"
    )
    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-5.jpeg"), 
      filename: "listing4-5.jpg"
    )
    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-6.jpeg"), 
      filename: "listing4-6.jpg"
    )


    listing_5 = Listing.create!(
      name: 'Luxury Beach View Apartment' ,
      description: 'Just a short stroll from beautiful LindaMar Beach, this large private spacious studio is perfect for your next beach getaway. It has a breathtaking unobstructed  ocean view which can be seen from anywhere in the unit, including the bathroom and shower. Surfboard rental is included with your stay offering a bonus activity for your trip! There is a huge private deck with a wraparound bench, lounge chairs, and a sunbed for your enjoyment while starring at one of the nicest ocean views in California' ,
      price: 194,
      address: "223 Stanley Ave, Pacifica, California, 94044",
      coordinates: '37.59493551449619 -122.51057679479852',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 2,
      num_of_baths: 1, 
      num_of_bedrooms: 1,
      num_of_beds: 1,
      owner_id: 5
    );
    
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-1.jpeg"), 
      filename: "listing5-1.jpg"
    )
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-2.jpg"), 
      filename: "listing5-2.jpg"
    )
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-3.jpeg"), 
      filename: "listing5-3.jpg"
    )
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-4.jpg"), 
      filename: "listing5-4.jpg"
    )
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-5.jpeg"), 
      filename: "listing5-5.jpg"
    )
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-6.jpeg"), 
      filename: "listing5-6.jpg"
    )

    puts "making reviews and resevations"

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/07/12",
      check_out_date: "2020/08/13",
      listing_id: 1,
      renter_id: 17,
    );

    Review.create!(
      rating: 4,
      body: "Our stay at this Airbnb was pleasant. The host was friendly and responsive. The apartment was clean and well-equipped. The location was convenient, with easy access to public transportation.",
      listing_id: 1,
      reviewer_id: 17,
      reservation_id: 1
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/07/12",
      check_out_date: "2020/08/13",
      listing_id: 1,
      renter_id: 21,
    );

    Review.create!(
      rating: 3,
      body: "The Airbnb had a great location, but the cleanliness was lacking. The host was accommodating and addressed our concerns promptly. Overall, an average experience.",
      listing_id: 1,
      reviewer_id: 21,
      reservation_id:  2
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/02/25",
      check_out_date: "2021/09/02",
      listing_id: 1,
      renter_id: 24,
    );

    Review.create!(
      rating: 5,
      body: "Absolutely loved our stay at this Airbnb! The host was incredibly hospitable, and the apartment was beautifully furnished. The view from the balcony was breathtaking. Highly recommended!",
      listing_id: 1,
      reviewer_id: 24,
      reservation_id: 3
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/09/30",
      check_out_date: "2020/11/27",
      listing_id: 1,
      renter_id: 23,
    );

    Review.create!(
      rating: 2,
      body: "We were disappointed with this Airbnb. The description didn't match the actual property, and there were maintenance issues. The host was unresponsive, making our experience unsatisfactory.",
      listing_id: 1,
      reviewer_id: 23,
      reservation_id: 4
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2023/04/19",
      check_out_date: "2023/07/28",
      listing_id: 1,
      renter_id: 9,
    );

    Review.create!(
      rating: 4,
      body: "The Airbnb was cozy and had a rustic charm. The host provided clear instructions and was helpful throughout our stay. The only drawback was the limited parking space.",
      listing_id: 1,
      reviewer_id: 9,
      reservation_id: 5
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2023/03/07",
      check_out_date: "2023/05/22",
      listing_id: 2,
      renter_id: 1 ,
    );

    Review.create!(
      rating: 3,
      body: "The location of this Airbnb was excellent, but the apartment itself was small and dated. The host was friendly, but the noise from the neighbors was disruptive.",
      listing_id: 2,
      reviewer_id: 1,
      reservation_id: 6
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/10/04",
      check_out_date: "2022/08/30",
      listing_id: 2,
      renter_id: 17,
    );

    Review.create!(
      rating: 5,
      body:"An exceptional Airbnb experience! The property was immaculate, and the host went above and beyond to ensure our comfort. The amenities exceeded our expectations. We would definitely return!" ,
      listing_id: 2,
      reviewer_id: 17,
      reservation_id: 7
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/01/19",
      check_out_date: "2020/08/13",
      listing_id: 2,
      renter_id: 1,
    );

    Review.create!(
      rating: 3,
      body: "This Airbnb had a good location, but the cleanliness could have been better. The host was responsive and provided helpful local tips. Average overall experience.",
      listing_id: 2,
      reviewer_id: 1,
      reservation_id: 8
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/09/09",
      check_out_date: "2022/01/22",
      listing_id: 2,
      renter_id: 22,
    );

    Review.create!(
      rating: 4,
      body: "We enjoyed our stay at this Airbnb. The apartment was spacious and well-furnished. The host was friendly and accommodating. The only downside was the slow Wi-Fi connection.",
      listing_id: 2,
      reviewer_id: 22,
      reservation_id: 9
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/07/12",
      check_out_date: "2020/08/13",
      listing_id: 2,
      renter_id: 15,
    );

    Review.create!(
      rating: 2,
      body: "Our experience at this Airbnb was disappointing. The cleanliness was subpar, and the amenities were lacking. The host was unresponsive to our concerns, making it an unsatisfactory stay.",
      listing_id: 2,
      reviewer_id: 15,
      reservation_id: 10
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/11/28",
      check_out_date: "2022/04/23",
      listing_id: 3,
      renter_id: 1,
    );

    Review.create!(
      rating: 5,
      body: "Outstanding Airbnb! The house was stunning, with luxurious amenities. The host was attentive and provided excellent service. It was a truly memorable and enjoyable stay. Highly recommended!",
      listing_id: 3,
      reviewer_id: 1,
      reservation_id: 11
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/11/03",
      check_out_date: "2021/08/22",
      listing_id: 3,
      renter_id: 2,
    );

    Review.create!(
      rating: 3,
      body:"The Airbnb had a great location, but the overall condition was average. The host was helpful and friendly. It was a decent place to stay for a short trip." ,
      listing_id: 3,
      reviewer_id: 2,
      reservation_id: 12
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/07/12",
      check_out_date: "2020/09/12",
      listing_id: 3,
      renter_id: 20,
    );

    Review.create!(
      rating: 3,
      body: "We had a wonderful time at this Airbnb. The cottage was cozy, and the host was accommodating. The surrounding nature added to the charm. Would consider staying again!",
      listing_id: 3,
      reviewer_id: 20,
      reservation_id: 13
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/07/04",
      check_out_date: "2022/04/23",
      listing_id: 3,
      renter_id: 8,
    );

    Review.create!(
      rating: 2,
      body: "Unfortunately, our experience at this Airbnb fell short of expectations. The cleanliness was below par, and the host was unresponsive. Disappointing overall.",
      listing_id: 3,
      reviewer_id: 8,
      reservation_id: 14
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/11/08",
      check_out_date: "2023/02/06",
      listing_id: 3,
      renter_id: 13,
    );

    Review.create!(
      rating: 5,
      body: "This Airbnb was a dream! The location was perfect, and the apartment was beautifully designed. The host was attentive and provided excellent recommendations. We would love to come back!",
      listing_id: 3,
      reviewer_id: 13,
      reservation_id: 15
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/01",
      check_out_date: "2022/12/19",
      listing_id: 4,
      renter_id: 1,
    );

    Review.create!(
      rating: 3,
      body: "The Airbnb had a convenient location, but it lacked proper maintenance. The host was responsive and tried to address our concerns. An average stay overall.",
      listing_id: 4,
      reviewer_id: 1,
      reservation_id: 16
    )

    puts "Done!"
