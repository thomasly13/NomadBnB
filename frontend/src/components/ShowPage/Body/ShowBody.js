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
                            <span className="show-listing-owner">Entire home hosted by {listing.owner.firstName} {listing.owner.lastName}</span>
                            <span className="show-listing-specific-information">{listing.numOfGuests} guests &bull; {listing.numOfBedrooms} bedrooms &bull; {listing.numOfBeds} beds &bull; {listing.numOfBaths} baths</span>
                        </div>
                        <hr className="information-line"></hr>

                        <div className="show-listing-highlight-information">

                            <div className="show-listing-superhost">
                                <div className="superhostIcon" style={{ color: "#ff385c", fontSize: "24px" }}>
                                    <i className="fa-solid fa-medal"></i>
                                </div>
                                <div className="highlight-information-container">
                                    <span className="highlight-title">{listing.owner.firstName} {listing.owner.lastName} is a Superhost</span>
                                    <span className="highlight-information">Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests.</span>                                     
                                </div>
    
                            </div>

                            <div className="show-listing-location">
                                <div className="superlocationIcon" style={{ color: "#ff385c", fontSize: "24px" }}>
                                    < i className="fa-solid fa-location-dot"></i>
                                </div>

                                <div className="highlight-information-container">
                                    <span className="highlight-title">Great Location</span>
                                    <span className="highlight-information">95% of recent guests gave the location a 5-star rating.</span>                                     
                                </div>

                            </div>

                            <div className="show-listing-experience">
                                <div className="superhostIcon" style={{ color: "#ff385c", fontSize: "24px" }}>
                                    <i className="fa-solid fa-key fa-flip-horizontal"></i>
                                </div>

                                <div className="highlight-information-container">
                                    <span className="highlight-title">Great check-in experience</span>
                                    <span className="highlight-information">95% of recent guests gave the check-in process a 5-star rating.</span>                                     
                                </div>

                            </div>
                        </div>

                        <hr className="information-line"></hr>
                        
                        <div className="show-body-description-container">
                            <span className="show-body-description">{listing.description}</span>
                        </div>

                        <hr className="information-line"></hr>

                        <h2>Rest of body</h2>
                        <h2>Reviews</h2>
                        <h2>Maps</h2>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>

                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>

                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>

                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>

                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <br></br>
                        <h2>Reviews</h2>                        
                    </div>
                    <div className="show-body-reservation">
                        <div className="reservation-container">
                            <div className="reservation-div">
                                <div className="reservation-title">
                                    <div className="reservation-title-price-night">
                                        <span className="reservation-title-price">${listing.price}</span>
                                        <span className="reservation-title-night"> night</span>
                                    </div>
                                    <span></span>
                                </div>
                                <div className="reservation-form">
                                </div>
                            </div>
                        </div>
                    </div>

                 
                </div>
            </div>
        </>
    )
}