# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    require "open-uri"
    
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Listing.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('listings')
  
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
      first_name: 'Demo', 
      last_name: 'Lition', 
      email: 'demo@user.com', 
      password: 'password'
    )
  
    # More users
    10.times do 
      User.create!({
        first_name: Faker::Internet.unique.username(specifier: 3),
        last_name: Faker::Internet.unique.username(specifier: 3),
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
      owner_id: 3
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
      owner_id: 1
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
      owner_id: 1
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
      owner_id: 1
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


    puts "Done!"
