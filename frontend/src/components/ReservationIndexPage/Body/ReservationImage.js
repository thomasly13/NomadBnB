import { useSelector } from "react-redux"

export const ReservationImage = ({reservation}) => {

    const listing = useSelector(state => state.listing[reservation.listingId])
    debugger
    return (
        <>  
            { listing === undefined ? null :
            <img src={listing.images[0]} className="reservation-image"></img>     
            }   
        </>
    )

}