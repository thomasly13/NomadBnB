import { useDispatch, useSelector } from "react-redux"
import "./ReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"
import { fetchUserDetail } from "../../../store/user"
import { useEffect } from "react"



export const PastReservationIndexBody = ({user}) => {

    const previousReservations = useSelector(state => Object.values(state.reservation.previousReservations))



    return (
        <>
        { (previousReservations === undefined) ? null : 
        <main className="reservation-index-body-container">
            <div className="reservation-current-trips-container">
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

            </div>

        </main>}        
        </>

    )
}