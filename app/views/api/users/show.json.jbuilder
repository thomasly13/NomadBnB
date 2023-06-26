json.user do
    json.extract! @user, :id, :email, :first_name, :last_name
    json.set! "reservations" do 
        @user.reservations.each do |reservation|
            json.set! reservation.id do 
                json.extract! reservation, :id, :check_in_date, :check_out_date
                json.set! "listing" do 
                    json.extract! reservation.listing, :id, :name
                    json.images reservation.listing.photos.map { |file| file.url }
                    json.set! "owner" do 
                        json.extract! reservation.owner, :id, :first_name
                    end
                end                
            end
        end

    end
end