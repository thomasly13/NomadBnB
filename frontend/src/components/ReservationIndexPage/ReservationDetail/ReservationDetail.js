import React, {useEffect} from "react";
import GoogleMapReact from 'google-map-react';
import { ReservationPageNavigation } from "../Navigation/ReservationPageNavigation";
import { ReservationDetailText } from "./ReservationDetailText";
import { useParams } from "react-router-dom";
import { useSelector, useDispatch} from "react-redux";
import { fetchReceiveReservation } from "../../../store/reservation";


export const ReservationDetail = () => {
    const {userId} = useParams();
    const {reservationId} = useParams();
    const dispatch = useDispatch();
    const user = useSelector(state => state.user[userId])
    const reservation = useSelector(state => state.reservation[reservationId])
    const listing = useSelector(state => (reservation ? state.listing[reservation.listingId] : null))

   
    useEffect(() => {
        window.scrollTo({top: 0, left:0 , behavior: "smooth"})
        dispatch(fetchReceiveReservation(reservationId))
    }, [dispatch, reservationId])


    const CoolMarker = () => {
        return (
            <div className="houseIcon" style={{ color: "#ffffff", fontSize: "21px" }}>
                <i className="fa-solid fa-house-chimney"></i>
            </div>   
        )
    }



    let defaultProps;
    let coordinates;
    
    (listing ? coordinates = listing.coordinates.split(' ') : coordinates = null)

    if (listing) {
        defaultProps = {
            center: {
            lat: parseFloat(coordinates[0]),
            lng: parseFloat(coordinates[1])
            },
            zoom: 16
        };        
    }


      return (
        // Important! Always set the container height explicitly
        <>  
            {listing && user && reservation ? 
            <div className="reservation-detail-component">
                < ReservationPageNavigation />
                <div className="reservation-detail-container">

                    < ReservationDetailText  reservation={reservation} user={user} listing={listing}/>
                
                    <div style={{ height: '90.2vh', width: '75%' }}>
                        <GoogleMapReact
                            bootstrapURLKeys={{ key:  "AIzaSyCL1buWaa613e2kJz-1qY5HBNNZamJaWG8" }}
                            defaultCenter={defaultProps.center}
                            defaultZoom={defaultProps.zoom}
                        >
                            <CoolMarker
                            lat={coordinates[0]}
                            lng={coordinates[1]}
                            text="My Marker"
                            />
                        </GoogleMapReact>
                    </div>
                </div>
            </div>
            : null }
        </>


      );
}