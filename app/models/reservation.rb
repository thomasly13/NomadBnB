class Reservation < ApplicationRecord
  belongs_to :listing,
  foreign_key: :listing_id,
  class_name: :Listing

  belongs_to :renter,
  foreign_key: :renter_id,
  class_name: :User

  has_one :owner,
  through: :listing,
  source: :owner

  def self.listing_reservations(listingId)
    return Reservation.select(:id)
    .where(listing_id: listingId)
  end
  
end
