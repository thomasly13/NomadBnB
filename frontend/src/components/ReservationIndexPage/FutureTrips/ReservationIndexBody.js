import { useSelector } from "react-redux"
import "./ReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"

export const ReservationIndexBody = ({user}) => {

 
    const futureReservations = useSelector(state => Object.values(state.reservation.futureReservations))
    


    

    return (
        <>
        { (futureReservations === undefined) ? null : 
        <main className="reservation-index-body-container">
            <container className="reservation-current-trips-container">
                <h1 className="reservation-title">Trips</h1>
                <div className="reservation-current-trips">
                    {futureReservations.map(reservation => {
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