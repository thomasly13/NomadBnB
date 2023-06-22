import "./ShowBody.css"


export const ShowBody = ({listing}) => {

    const locationHelper = () => {
        let address = listing.address.split(", ");
        let location = address.slice(1, 3);
        return location.join(", ")
    }

    return (
        <>          
            <div className="show-body">
                <div className="show-header">
                    <h1 className="listing-name">{listing.name}</h1>
                    <h2 className="listing-location">{locationHelper()}</h2>                    
                </div>
                <div className="show-image-container">
                    <img src={listing.images[0]} className="show-left-image"/>
                    <div className="smaller-image-container">
                        <div className="smaller-image-column-1">
                            <img src={listing.images[1]} className="show-image"/>
                            <img src={listing.images[2]} className="show-image-2"/>
                        </div>
                        <div className="smaller-image-column-2">
                            <img src={listing.images[3]} className="show-image"/>
                            <img src={listing.images[4]} className="show-image-2"/>
                        </div>
                    </div>
                </div>
                <div className="show-body-information">
                    <div className="show-body-information-tab">
                        <div className="show-listing-information">
                            <span className="show-listing-owner">Entire home hosted by {listing.owner.firstName}</span>
                            <span className="show-listing-specific-information">{listing.numOfGuests} guests &bull; {listing.numOfBedrooms} bedrooms &bull; {listing.numOfBeds} beds &bull; {listing.numOfBaths} baths</span>
                        </div>
                        <hr className="information-line"></hr>

                        <h2>Rest of body</h2>
                        <h2>Reviews</h2>
                        <h2>Maps</h2>
                        <h2>Reviews</h2>                        
                    </div>
                    <div className="show-body-reservation">
                    </div>                    
                </div>
                

            </div>
        </>
    )
}