import "./PreviousReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"
import { useState, useEffect } from "react"
import { useHistory } from "react-router-dom/cjs/react-router-dom.min"


export const PastReservationIndexBody = ({user, reservation}) => {

    const history = useHistory();

    const previousReservations = Object.values(reservation.previousReservations)

    const toHome = (e) => {
        e.preventDefault();
        history.push("/")
    }

    return (
        <>
        { (previousReservations === undefined ) ? null : 
        <main className="reservation-index-body-container">
            <div className="reservation-current-trips-container">
                <h1 className="reservation-current-title">Past Trips</h1>
                { previousReservations[0] === null ? 
                <div className="reservation-current-trips-1">
                    <div className="coolHand" style={{ color: "#ff385c", fontSize: "48px" }}>
                        <i className="fa-solid fa-hand-peace"></i>
                    </div>
                    <span className="state-searching-title">No past trips...yet!</span>
                    <span className="state-searching-description">Time to dust off your bads and start planning your next adventure</span>
                    <button onClick={toHome} className="start-searching-button">Start Searching</button>

                    
                </div> :

                <div className="reservation-current-trips">
                    {previousReservations.map(reservation => {
                        return (
                            <div className="current-reservation-container"  onClick={() => {history.push(`/users/${user.id}/reservations/${reservation.id}`)}} >
                                < ReservationImage reservation={reservation}/>
                                < ReservationContainerText reservation={reservation} />
                            </div>
                        )
                    })} 
                </div>
                    }
            </div>

        </main>}        
        </>

    )
}