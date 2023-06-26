import { useDispatch, useSelector } from "react-redux"
import "./ReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"
import { deleteExistingReservation } from "../../../store/reservation"
import { Modal } from "../../../context/Modal"
import { useState } from "react"
import { ReservationEdit } from "./RservationEdit"


export const ReservationIndexBody = ({user, userId}) => {

    const [showModal, setShowModal] = useState(false);
    const dispatch = useDispatch();
    const futureReservations = useSelector(state => Object.values(state.reservation.futureReservations))
    
    const handleModalOpen = async (e) => {
        setShowModal(true);
    };

    const handleModalClose = (e) => {
        setShowModal(false);
    };


    return (
        <>
        { (futureReservations === undefined) ? null : 
        <main className="reservation-index-body-container">
            <div className="reservation-current-trips-container">
                <h1 className="reservation-title">Trips</h1>
                <div className="reservation-current-trips">
                    {futureReservations.map(reservation => {
                        return (
                            <div className="current-reservation-container">
                                < ReservationImage reservation={reservation}/>
                                < ReservationContainerText reservation={reservation} />
                                <button onClick={() => { dispatch(deleteExistingReservation(reservation.id, userId))}}>Delete</button>
                                <button onClick={handleModalOpen}>
                                    Edit
                                </button>
                                {showModal && (
                                    <Modal onClose={handleModalClose}  >
                                        <ReservationEdit reservation={reservation} modalFunction={handleModalClose}/>
                                    </Modal>
                                )}
                            </div>
                        )
                    })}
                </div>

            </div>

        </main>}        
        </>

    )
}