import { useSelector } from "react-redux"
import "./ReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"

export const ReservationIndexBody = ({user}) => {

 
    const previousReservations = useSelector(state => Object.values(state.reservation.previousReservations))
    const futureReservations = useSelector(state => Object.values(state.reservation.futureReservations))
  

    return (
        <>
        { (previousReservations === undefined || futureReservations === undefined) ? null : 
        <main className="Reservation-index-body-container">
            <container className="reservation-current-trips-container">
                <h1>Trips</h1>
                <div className="reservation-current-trips">
                    {previousReservations.map(reservation => {
                        return (
                            <div className="current-reservation-container">
                                < ReservationImage reservation={reservation}/>
                            </div>
                        )
                    })}
                </div>

            </container>

        </main>}        
        </>

    )
}