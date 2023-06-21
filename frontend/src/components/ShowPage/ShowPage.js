import { useEffect } from "react";
import { useSelector, useDispatch} from "react-redux";
import { fetchListingDetail } from "../../store/listing";
import { useParams } from "react-router-dom";


export const ListingShow = () => {
    const {listingId} = useParams();
    const dispatch = useDispatch();

    const listing = useSelector(state => state.listing[listingId]);


    useEffect(() => {
        dispatch(fetchListingDetail(listingId))
    }, [dispatch])


    return (
        <>
            { listing ? <span>{listing.name}</span> : null}
        </>
    )
};