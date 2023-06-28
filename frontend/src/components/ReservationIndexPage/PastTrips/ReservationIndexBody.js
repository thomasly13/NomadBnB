import { useDispatch, useSelector } from "react-redux"
import "./PreviousReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"

import { useState, useEffect } from "react"
import { Modal } from "../../../context/Modal"
import { ReservationReviewCreate } from "./ReviewForm/ReservationReviewCreate"
import { ReservationReviewEdit } from "./ReviewForm/ReservationReviewEdit"




export const PastReservationIndexBody = ({user, reservation}) => {

    const previousReservations = Object.values(reservation.previousReservations)
    const [showEditModal, setShowEditModal] = useState(false);
    const [showCreateModal, setShowCreateModal] = useState(false);

    const [resId, setResId] = useState(null);
    


    const handleEditModalClose = () => {
        setShowEditModal(false);
    };

    const handleCreateModalClose = () => {
        setShowCreateModal(false);
    };

    const handleCreateModalOpen = async (reservationId) => {

        setResId(reservationId);
        setShowCreateModal(true);
    };

    const handleEditModalOpen = async (reservationId) => {

        setResId(reservationId);
        setShowEditModal(true);
    };


    return (
        <>
        { (previousReservations === undefined  || previousReservations[0] === null) ? null : 
        <main className="reservation-index-body-container">
            <div className="reservation-current-trips-container">
                <h1 className="reservation-current-title">Past Trips</h1>
                <div className="reservation-current-trips">
                    {previousReservations.map(reservation => {
                        return (
                            <div className="current-reservation-container" onClick={reservation.reviewId ? () => {handleEditModalOpen(reservation.id)} : () => {handleCreateModalOpen(reservation.id)}} >
                                < ReservationImage reservation={reservation}/>
                                < ReservationContainerText reservation={reservation} />
                            </div>
                        )
                    })}
                    {showCreateModal && (
                        <Modal  onClose={handleCreateModalClose}  >
                            <ReservationReviewCreate reservationId={resId} modalFunction={handleCreateModalClose}/>
                        </Modal>
                    )} 
                    {showEditModal && (
                        <Modal  onClose={handleEditModalClose}  >
                            < ReservationReviewEdit reservationId={resId} modalFunction={handleEditModalClose}/>
                        </Modal>
                    )}  
                </div>

            </div>

        </main>}        
        </>

    )
}