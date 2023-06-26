import "./ReservationIndexBody.css"

export const ReservationIndexBody = ({reservations}) => {
    return (
        <main className="Reservation-index-body-container">
            <container className="reservation-current-trips-container">
                <h1>Trips</h1>
                <div className="reservation-current-trips">
                    {reservations.map(reservation => {
                        return (
                            <div className="current-reservation-container">
                                <img src={reservation.listing.images[0]} className="reservation-image"></img>
                            </div>
                        )
                    })}
                </div>
            </container>

        </main>

    )
}