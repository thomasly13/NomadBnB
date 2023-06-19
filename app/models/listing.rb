class Listing < ApplicationRecord
    validates :name, :description,
     :price, :address, :coordinates,
      :amenities, :num_of_guests, :num_of_baths,
       :num_of_bedrooms, :num_of_beds, :owner_id, presence: true

    belongs_to :owner,
    foreign_key: :owner_id,
    class_name: :User
end
