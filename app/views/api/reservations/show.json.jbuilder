json.listing do 
    json.extract! @reservation.listing, :id, :name, :description, :price, :address, :coordinates, :amenities, :num_of_guests, :num_of_baths, :num_of_bedrooms, :num_of_beds, :owner_id
    json.images @reservation.listing.photos.map { |file| file.url }   
    if @reservation.review
        json.reviewId @reservation.review.id
    else
        json.reviewId nil
    end
end

json.reservation do 
    json.extract! @reservation, :id, :num_of_guests, :check_in_date, :check_out_date, :listing_id, :renter_id
end

json.user do 
    json.extract! @reservation.renter, :id, :first_name, :last_name
end