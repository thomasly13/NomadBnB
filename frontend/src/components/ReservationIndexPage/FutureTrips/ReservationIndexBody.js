import { useDispatch, useSelector } from "react-redux"
import "./ReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"
import { deleteExistingReservation, fetchShowReservation } from "../../../store/reservation"
import { Modal } from "../../../context/Modal"
import { useState, useEffect} from "react"
import { ReservationEdit } from "./RservationEdit"
import { fetchUserDetail } from "../../../store/user"




export const ReservationIndexBody = ({user, userId}) => {

    const [showModal, setShowModal] = useState(false);
    const [resId, setResId] = useState(null);
    const dispatch = useDispatch();
    debugger


    const futureReservations = useSelector(state => Object.values(state.reservation.futureReservations))
    

    
    const handleModalOpen = async (reservationId) => {

        setResId(reservationId);
        setShowModal(true);

    };

    const handleModalClose = (userId) => {
        setShowModal(false);
    };


    return (
        <>
        { (futureReservations === undefined) ? null : 
        <main className="reservation-index-body-container">
            <div className="reservation-current-trips-container">
                <h1 className="reservation-current-title">Trips</h1>
                <div className="reservation-current-trips">
                    {futureReservations.map(reservation => {
                        return (
                            <>
                                <div className="current-reservation-container">
                                    < ReservationImage reservation={reservation}/>
                                    < ReservationContainerText reservation={reservation} />
                                    <button onClick={() => { dispatch(deleteExistingReservation(reservation.id, userId))}}>Delete</button>
                                    <button onClick={() => {handleModalOpen(reservation.id)}}>
                                        Edit
                                    </button>

                                </div>
                            </>

                        )
                    })}
                    {showModal && (
                        <Modal  onClose={() => {handleModalClose()}}  >
                            <ReservationEdit reservationId={resId} modalFunction={handleModalClose}/>
                        </Modal>
                    )}             
                </div>

            </div>

        </main>}        
        </>

    )
}