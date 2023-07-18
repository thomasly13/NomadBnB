import { useEffect } from "react";
import { useSelector, useDispatch} from "react-redux";
import { fetchAllListings } from "../../../store/listing";
import "./ListingsIndex.css"
import { ImageCarousel } from "./imageCarousel";
import { NavLink, useHistory } from "react-router-dom/cjs/react-router-dom.min";
import GoogleMapReact from 'google-map-react';
import { useState } from "react";


export const ListingsIndex = () => {

    const history = useHistory();

    const listings = useSelector(state => Object.values(state.listing));

    const dispatch = useDispatch();

    const [showMap, setShowMap] = useState(false);

    useEffect(() => {
        dispatch(fetchAllListings())
    }, [dispatch])

    const toListing = (e, id) => {
        e.stopPropagation();
        history.push(`/listings/${id}`)

    }

    const CoolMarker = ({id}) => {
        return (
            <div className="houseIcon" style={{ color: "#ffffff", fontSize: "18px" }} onClick={(e) => toListing(e, id)}>
                <i className="fa-solid fa-house-chimney"></i>
            </div>   
        )
    }

    const toggleMap = (e) => {
        e.stopPropagation();
        const cool = document.getElementById("cooler-map")
        if (!showMap) {
            cool.classList.remove(".off-map")
            cool.classList.add(".on-map")
            setShowMap(false)
            return
        } else {
            cool.classList.remove(".on-map")
            cool.classList.remove(".off-map")
            setShowMap(true)
        }
        
    }

    let defaultProps;
    let coordinates;
    
    // (listing ? coordinates = listing.coordinates.split(' ') : coordinates = null)

    // if (listing) {
 
    // }
        defaultProps = {
            center: {
            lat: 37.76028551221444,
            lng: -122.50293691134891
            },
            zoom: 12.5
        };       

    

    const helper = (listing) => {

        let address = listing.address.split(", ");
        let location = address.slice(1, 3);
        return location.join(", ")
    };

    


    return (
        <>
            <div className="listings-container" >


                {listings.map(listing => {
                    return (
                    <NavLink className="listing-property" to={`/listings/${listing.id}`}>
                        < ImageCarousel images={listing.images} />
                        <span className="listing-property-location">{helper(listing)}</span>
                        {listing.numOfBeds === 1 ? <span className="listing-property-beds">{listing.numOfBeds} bed</span> : <span className="listing-property-beds">{listing.numOfBeds} beds</span>}
                        <div className="listing-property-nights">
                            <span className="listing-property-price" >${listing.price} </span>
                            <span className="listing-property-night">night</span>
                        </div>
                        

                    </NavLink>)

                })}

            </div>
            <button className="cooler-button" onClick={toggleMap}>
                <div className="cooler-button-container">
                    <span className="cooler-button-text">Show Map</span>
                    <div style={{ color: "white", fontSize: "20px" }}>
                        <i className="fa-solid fa-map"></i>                    
                    </div>                    
                </div>


                <div id="cooler-map" >
                    <GoogleMapReact
                            bootstrapURLKeys={{ key:  "AIzaSyCL1buWaa613e2kJz-1qY5HBNNZamJaWG8" }}
                            defaultCenter={defaultProps.center}
                            defaultZoom={defaultProps.zoom}
                        >
                        {listings.map(listing => {
                            const split = listing.coordinates.split(" ")
                            return (
                                <CoolMarker
                                lat={split[0]}
                                lng={split[1]}
                                text="My Marker"
                                id={listing.id}  
                                /> 
                                                             
                            )
                        })}

                    </GoogleMapReact>
                </div>                
            </button>


        </>
    )

}