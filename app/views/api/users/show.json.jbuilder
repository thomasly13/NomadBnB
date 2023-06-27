
json.user do
    json.set! "currentUser" do 
        json.extract! @user, :id, :email, :first_name, :last_name       
    end
    json.set! @user.id do
             
    end

    @user.reservations.each do |reservation|
        json.set! reservation.owner.id do
            json.extract! reservation.owner, :id, :first_name            
        end
    end
end

json.set! 'reservations' do
    json.set! 'previousReservations' do
        @user.reservations.previous_reservations(@user.id).each do |reservation|
            json.set! reservation.id do
                json.extract! reservation, :id, :num_of_guests, :check_in_date, :check_out_date, :listing_id, :renter_id
            end
        end        
    end 

    json.set! 'futureReservations' do 
        @user.reservations.future_reservations(@user.id).each do |reservation|
            json.set! reservation.id do
                json.extract! reservation, :id, :num_of_guests, :check_in_date, :check_out_date, :listing_id, :renter_id
            end
        end        
    end

end

json.set! "listings" do 
    @user.reservations.each do |reservation|
        json.set! reservation.listing_id do
            json.extract! reservation.listing, :id, :name, :address, :owner_id, :num_of_guests
            json.images reservation.listing.photos.map { |file| file.url }
        end
    end
end

json.set! "reviews" do 
    @user.reviews.each do |review|
        json.set! review.id do 
            json.extract! review, :id, :rating, :body, :listing_id, :reviewer_id, :reservation_id
        end
    end
end

