# == Schema Information
#
# Table name: reservations
#
#  id             :bigint           not null, primary key
#  num_of_guests  :integer          not null
#  check_in_date  :date             not null
#  check_out_date :date             not null
#  listing_id     :bigint           not null
#  renter_id      :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Reservation < ApplicationRecord
  validates :num_of_guests, :check_in_date,
    :check_out_date, :listing_id, :renter_id, presence: true


  belongs_to :listing,
  foreign_key: :listing_id,
  class_name: :Listing

  belongs_to :renter,
  foreign_key: :renter_id,
  class_name: :User

  has_one :owner,
  through: :listing,
  source: :owner,
  dependent: :destroy

  has_one :review,
  foreign_key: :reservation_id,
  class_name: :Review,
  dependent: :destroy

  def self.listing_reservations(listingId)
    return Reservation.select(:id)
    .where(listing_id: listingId)
  end

  def self.previous_reservations(renter_id)
    return Reservation.includes(:renter)
    .where("check_out_date <= ?", Date.today)
    .where(renter: {id: renter_id})
  end 

  def self.future_reservations(renter_id)
    return Reservation.includes(:renter)
    .where("check_in_date >= ?", Date.today)
    .where(renter: {id: renter_id})
  end 
  
end
