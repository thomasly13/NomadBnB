import { useDispatch, useSelector } from "react-redux"
import "./ReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"
import { deleteExistingReservation, fetchShowReservation } from "../../../store/reservation"
import { Modal } from "../../../context/Modal"
import { useState, useEffect} from "react"
import { ReservationEdit } from "./RservationEdit"





export const ReservationIndexBody = ({user, userId, reservation}) => {

    const [showModal, setShowModal] = useState(false);
    const [resId, setResId] = useState(null);
    const dispatch = useDispatch();



    const futureReservations = Object.values(reservation.futureReservations)
    

    
    const handleModalOpen = async (reservationId) => {

        setResId(reservationId);
        setShowModal(true);

    };

    const handleModalClose = (userId) => {
        setShowModal(false);
    };


    return (
        <>
        { (futureReservations === undefined || futureReservations[0] === null) ? null : 
        <main className="reservation-index-body-container">
            <div className="reservation-current-trips-container">
                <h1 className="reservation-current-title">Trips</h1>
                <div className="reservation-current-trips">
                    {futureReservations.map(reservation => {
                        return (
                            <>
                                <div className="current-reservation-container" onClick={() => {handleModalOpen(reservation.id)}}>
                                    < ReservationImage reservation={reservation}/>
                                    < ReservationContainerText reservation={reservation} />
                                </div>
                            </>

                        )
                    })}
                    {showModal && (
                        <Modal  onClose={() => {handleModalClose()}}  >
                            <ReservationEdit reservationId={resId} userId={userId} modalFunction={handleModalClose} />
                        </Modal>
                    )}             
                </div>

            </div>

        </main>}        
        </>

    )
}