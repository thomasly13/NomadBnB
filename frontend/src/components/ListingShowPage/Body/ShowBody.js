import { useSelector } from "react-redux";
import { ShowHeader } from "./Header/ShowHeader";
import { ShowReservation } from "./Reservation/ShowReservation";
import { useEffect } from "react";
import "./ShowBody.css"



export const ShowBody = ({listing}) => {
    const locationHelper = () => {
        let address = listing.address.split(", ");
        let location = address.slice(1, 3);
        return location.join(", ")
    }


    const owner = useSelector(state => state.user[listing.ownerId]);

    return (
        <>     
            {owner === undefined ? null :    
            <div className="show-body">
                < ShowHeader listing={listing} locationHelper={locationHelper}/>
                <div className="show-body-information">
                    <div className="show-body-information-tab">
                        <div className="show-listing-information">
                            <span className="show-listing-owner">Entire home hosted by {owner.firstName} {owner.lastName}</span>
                            <span className="show-listing-specific-information">{listing.numOfGuests} guests &bull; {listing.numOfBedrooms} bedrooms &bull; {listing.numOfBeds} beds &bull; {listing.numOfBaths} baths</span>
                        </div>
                        <hr className="information-line"></hr>

                        <div className="show-listing-highlight-information">

                            <div className="show-listing-superhost">
                                <div className="superhostIcon" style={{ color: "#ff385c", fontSize: "24px" }}>
                                    <i className="fa-solid fa-medal"></i>
                                </div>
                                <div className="highlight-information-container">
                                    <span className="highlight-title">{owner.firstName} {owner.lastName} is a Superhost</span>
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
                    
                    <ShowReservation listing={listing} />

                 
                </div>
            </div>}
        </>
    )
}