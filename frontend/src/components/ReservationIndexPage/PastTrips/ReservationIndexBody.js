import { useSelector } from "react-redux"
import "./ReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"

export const FutureReservationIndexBody = ({user}) => {

 
    const previousReservations = useSelector(state => Object.values(state.reservation.previousReservations))

    


    return (
        <>
        { (previousReservations === undefined) ? null : 
        <main className="reservation-index-body-container">
            <container className="reservation-current-trips-container">
                <h1>Past Trips</h1>
                <div className="reservation-current-trips">
                    {previousReservations.map(reservation => {
                        return (
                            <div className="current-reservation-container">
                                < ReservationImage reservation={reservation}/>
                                < ReservationContainerText reservation={reservation} />
                            </div>
                        )
                    })}
                </div>

            </container>

        </main>}        
        </>

    )
}