@listings.each do |listing|
    json.set! listing.id do 
        json.extract! listing, :id, :name, :description, :price, :address, :coordinates, :amenities, :num_of_guests, :num_of_baths, :num_of_bedrooms, :num_of_beds
        json.images listing.photos.map { |file| file.url }
        json.set! 'owner' do 
            json.extract! listing.owner, :id, :first_name, :last_name
        end
    end
end