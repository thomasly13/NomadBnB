# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do 
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
      last_name: 'lition', 
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

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/miso/Hosting-877145841215544868/original/68250ffb-6c5e-4145-8bac-a5b41d0058cc.jpeg?im_w=720", "https://a0.muscache.com/im/pictures/miso/Hosting-877145841215544868/original/3e3ae93d-f596-47de-8867-49c6e2491801.jpeg?im_w=720", "https://a0.muscache.com/im/pictures/miso/Hosting-877145841215544868/original/72f15dd5-7794-49ba-9d79-8a1561973f11.jpeg?im_w=720", "https://a0.muscache.com/im/pictures/miso/Hosting-877145841215544868/original/931738e4-c7c4-4585-9304-2c9e8c5afd2a.jpeg?im_w=720", "https://a0.muscache.com/im/pictures/miso/Hosting-877145841215544868/original/da9d576c-cde3-4737-97f9-eb647d2f8488.jpeg?im_w=720", "https://a0.muscache.com/im/pictures/miso/Hosting-877145841215544868/original/4d555aca-f451-4b3f-adde-ef6f127e15fc.jpeg?im_w=720", "https://a0.muscache.com/pictures/miso/Hosting-877145841215544868/original/402f8587-45f9-4338-ae1f-fe827c032610.jpeg", "https://a0.muscache.com/pictures/miso/Hosting-877145841215544868/original/a05aae31-a1a2-420d-8413-a11bce5ee2a8.jpeg", "https://a0.muscache.com/pictures/miso/Hosting-877145841215544868/original/e93fa9b6-8efb-46a6-bbe3-90372023e5bc.jpeg", "https://a0.muscache.com/pictures/miso/Hosting-877145841215544868/original/baabc51e-8977-4416-8a9e-cfd0156f8f1e.jpeg" ],
      owner_id: 3
    )

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );

    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );
    Listing.create!(
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
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1
    );


    puts "Done!"
  end