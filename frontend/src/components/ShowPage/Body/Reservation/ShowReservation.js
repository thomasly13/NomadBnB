import { useState } from "react"
import { useDispatch } from "react-redux"
import "../ShowBody.css"



export const ShowReservation = ({listing}) => {

  const [checkInDate, setCheckInDate] = useState();
  const [checkOutDate, setCheckOutDate] = useState();
  const [guests, setGuests] = useState(1);


  return (
    <div className="show-body-reservation">
      <div className="reservation-container">
          <div className="reservation-div">
              <div className="reservation-title">
                  <div className="reservation-title-price-night">
                      <span className="reservation-title-price">${listing.price}</span>
                      <span className="reservation-title-night"> night</span>
                  </div>
                  <span></span>
              </div>

              <div className="reservation-form-container">
                <form>
                  <div className="reservation-form-input">
                    <button className="reservation-form-date-container">
                      <div className="check-in-form">
                        <span className="check-in-text">CHECK-IN</span>
                        <span className="check-in-input">Add date</span>
                      </div>
                      <div className="check-out-form">
                        <span className="check-out-text">CHECKOUT</span>
                        <span className="check-out-input">Add date</span>
                      </div>
                    </button>
                    <div className="reservation-form-guests-container">
                      <span className="guests-text">GUESTS</span>
                      { guests === 1 ? <div className="guests-input">{guests} guest</div> : <div className="guests-input">{guests} guests</div> }
                    </div>                    
                  </div>

                  <button className="reservation-submit-button" type="submit">
                    <span >Check availability</span> 
                  </button>                    
                </form>


              </div>

          </div>
      </div>
    </div>    
  )

}