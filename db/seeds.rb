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
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
  
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
      address: "223 Stanley Ave, Pacifica, CA 94044",
      coordinates: '37.59493551449619 -122.51057679479852',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 2,
      num_of_baths: 1, 
      num_of_bedrooms: 1,
      num_of_beds: 1,
      images: ["https://a0.muscache.com/im/pictures/c2c8fa5d-0737-4dbe-934b-b973cbf57ac7.jpg?im_w=1200", "https://a0.muscache.com/im/pictures/96932be6-d238-44ca-8501-b3fbe75376ff.jpg?im_w=720", "https://a0.muscache.com/im/pictures/43b580f3-84a5-4971-9377-28e915c56c2e.jpg?im_w=720", "https://a0.muscache.com/im/pictures/f5943e09-b0be-4359-b3ef-ef7cba2c6762.jpg?im_w=720", "https://a0.muscache.com/im/pictures/7af807fa-265e-4faf-8d02-a0ba3b99caa2.jpg?im_w=720", "https://a0.muscache.com/pictures/c038a845-4958-457c-b7b0-08b52f0f96bc.jpg", "https://a0.muscache.com/pictures/440e23e6-aa7d-40e8-b257-8d0e6afcaca2.jpg", "https://a0.muscache.com/pictures/87e8a26a-c41b-47bc-8e3f-ff8e79ba88b1.jpg", "https://a0.muscache.com/pictures/c6aeebb3-4a6f-42d9-ab1a-ecf34f758907.jpg", "https://a0.muscache.com/pictures/69e991ca-9b6a-4b3d-967a-fbf18327edb6.jpg", "https://a0.muscache.com/pictures/208e8a55-e4e6-4444-ae83-96a28e20fc84.jpg"],
      owner_id: 1

    

    )
  
    puts "Done!"
  end