import { useDispatch } from "react-redux"
import "./ReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"
import { Modal } from "../../../context/Modal"
import { useState} from "react"
import { ReservationEdit } from "./RservationEdit"
import { ReservationDetail } from "../ReservationDetail/ReservationDetail"
import { useHistory } from "react-router-dom"





export const ReservationIndexBody = ({user, userId, reservation}) => {

    const [showModal, setShowModal] = useState(false);
    const [resId, setResId] = useState(null);
    const dispatch = useDispatch();
    const history = useHistory();


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
                                <div className="current-reservation-container" onClick={() => {history.push(`/users/${userId}/reservations/${reservation.id}`)}}>
                                    < ReservationImage reservation={reservation}/>
                                    < ReservationContainerText reservation={reservation} />
                                </div>
                            </>

                        )
                    })}      
                </div>

            </div>

        </main>}        
        </>

    )
}