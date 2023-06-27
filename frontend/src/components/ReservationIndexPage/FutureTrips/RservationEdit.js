import { useSelector, useDispatch } from "react-redux";
import { useState } from "react";
import "./ReservationIndexBody.css"
import { updateExistingReservation } from "../../../store/reservation";


export const ReservationEdit = ({reservationId, modalFunction}) => {

    const dispatch = useDispatch();
    const reservation = useSelector(state => state.reservation.futureReservations[reservationId])
    
    const [guests, setGuests] = useState(reservation.numOfGuests)


    const listing = useSelector(state => state.listing[reservation.listingId]);

    const intervalGuestsDown = () => {
        if (guests !== 1) {
          setGuests(guests - 1)   
        }
      }
    
      const intervalGuestsUp = () => {

        if (guests !== listing.numOfGuests) {
          setGuests(guests + 1)   
        }   
    }

    const handleUpdate = async (e) => {
        const reservationDetails = {
            numOfGuests: guests,
            checkInDate: reservation.checkInDate,
            checkOutDate: reservation.checkOutDate,
            listingId: reservation.listingId,
            id: reservation.id
        }
        const res = await dispatch(updateExistingReservation(reservationDetails))
        modalFunction();     
    };


    return (
        <>
            { listing === undefined ? null :
                <div className="reservation-edit-container">
                    <div className="reservation-edit-image-container">
                        <img src={listing.images[0]} className="reservation-edit-image"></img>                           
                    </div>
                    <div className="reservation-edit-date-container">
                        <div className="reservation-edit-check-in-date-container">
                            <span className="reservation-edit-check-date-words">Check-In</span>
                            <span className="reservation-edit-check-date-words-2">{reservation.checkInDate}</span>
                            <span className="reservation-edit-check-date-words-3">3:00 PM</span>
                        </div>
                        <div className="reservation-edit-check-out-date-container">
                            <span className="reservation-edit-check-date-words">Check-Out</span>
                            <span className="reservation-edit-check-date-words-2">{reservation.checkOutDate}</span>
                            <span className="reservation-edit-check-date-words-3">1:00 PM</span>
                        </div>
                    </div>
                    <div className="reservation-edit-guests-container">
                        <div className="guest-drop-down-adults-container">
                            <div className="adults-text-container">
                                <span className="adults-text">Guests</span>
                            </div>
                            <div className="guest-number-buttons">
                                <div className="guest-reservation-button-counters" onClick={intervalGuestsDown} style={{ color: "#717171", fontSize: "15px" }}>
                                    <i className="fa-solid fa-minus"></i>
                                </div>
                                <span>{guests}</span>
                                <div className="guest-reservation-button-counters" onClick={intervalGuestsUp} style={{ color: "#717171", fontSize: "15px" }}>
                                    <i className="fa-solid fa-plus"></i>
                                </div>
                            </div>
                        </div>     
                    </div>
                    <button onClick={handleUpdate} className="reservation-edit-button">
                        <span>Finish Edit</span> 
                    </button>   
                </div>
            }  
        </>

    )
}