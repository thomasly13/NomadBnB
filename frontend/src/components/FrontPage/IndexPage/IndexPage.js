import { useEffect } from "react";
import { useSelector, useDispatch} from "react-redux";
import { fetchAllListings } from "../../../store/listing";
import "./ListingsIndex.css"
import { ImageCarousel } from "./imageCarousel";

export const ListingsIndex = () => {

    const listings = useSelector(state => Object.values(state.listing));
    
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchAllListings())
    }, [dispatch])
    
    const helper = (listing) => {
        let address = listing.address.split(", ");
        let location = address.slice(1, 3);
        return location.join(", ")
    };
    
    return (
        <>
            <div className="listings-container">


                {listings.map(listing => {
                    
                    return (
                    <div className="listing-property">
                        < ImageCarousel images={listing.images}/>
                        <span className="listing-property-location">{helper(listing)}</span>
                        {listing.numOfBeds === 1 ? <span className="listing-property-beds">{listing.numOfBeds} bed</span> : <span className="listing-property-beds">{listing.numOfBeds} beds</span>}
                        <div className="listing-property-nights">
                            <span className="listing-property-price" >${listing.price} </span>
                            <span className="listing-property-night">night</span>
                        </div>
                        

                    </div>)

                })}

            </div>

        </>
    )

}