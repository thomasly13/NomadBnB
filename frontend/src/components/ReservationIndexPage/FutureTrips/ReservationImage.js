import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux"


export const ReservationImage = ({reservation}) => {

    const dispatch = useDispatch()

    const listing = useSelector(state => state.listing[reservation.listingId]);

    return (
        <>  
            { listing === undefined ? null :
            <img src={listing.images[0]} className="reservation-image"></img>     
            }   
        </>
    )

}