import { useSelector, useDispatch } from "react-redux";
import { useState } from "react";
import "./ReservationIndexBody.css"
import { deleteExistingReservation, updateExistingReservation } from "../../../store/reservation";



export const ReservationEdit = ({reservationId, modalFunction, userId}) => {

    const dispatch = useDispatch();
    const reservation = useSelector(state => state.reservation.futureReservations[reservationId])

    const [edit, setEdit] = useState(false)
    
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

    const handleDelete = async (e) => {

        const res = dispatch(deleteExistingReservation(reservation.id, userId));
        modalFunction();
    }

    const handleEditToggle = () => {
        setEdit(true);
    }


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
                    <div className="reservation-information-payment-information-container">
                        <span>Payment Info</span>
                        <span>Nights</span>
                        <span>Night number</span>
                        <span>Total Cost</span>
                        <span>Cost per night times nights</span>
                    </div>
                    { !edit ? null : 
                    <div className="reservation-edit-guests-container">
                        <div className="guest-drop-down-adults-container-1">
                            <div className="adults-text-container-1">
                                <span className="adults-text-1">Guests:</span>
                            </div>
                            <div className="guest-reservation-button-counters" onClick={intervalGuestsDown} style={{ color: "#717171", fontSize: "15px" }}>
                                <i className="fa-solid fa-minus"></i>
                            </div>
                            <span>{guests}</span>
                            <div className="guest-reservation-button-counters" onClick={intervalGuestsUp} style={{ color: "#717171", fontSize: "15px" }}>
                                <i className="fa-solid fa-plus"></i>
                            </div>

                        </div>     
                    </div>}
                    { edit ? <button onClick={handleUpdate} className="reservation-edit-button">
                        <span>Finish Edit</span> 
                    </button> :
                    <button onClick={handleEditToggle} className="reservation-edit-button">
                        <span>Edit Event</span>
                    </button>}

                    <button onClick={handleDelete} className="reservation-edit-button">
                        Cancel Event
                    </button>  
                </div>
            }  
        </>

    )
}