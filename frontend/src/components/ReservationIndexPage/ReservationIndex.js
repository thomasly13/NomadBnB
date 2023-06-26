import { ReservationIndexBody } from "./FutureTrips/ReservationIndexBody"
import { ReservationPageNavigation } from "./Navigation/ReservationPageNavigation"
import { useParams } from "react-router-dom";
import { useSelector, useDispatch} from "react-redux";
import { useEffect} from "react";
import { fetchUserDetail } from "../../store/user";
import { FutureReservationIndexBody } from "./PastTrips/ReservationIndexBody";


export const ReservationIndex = () => {
    const {userId} = useParams();
    const dispatch = useDispatch();

    const user = useSelector(state => state.user[userId])

    useEffect(() => {
        window.scrollTo({top: 0, left:0 , behavior: "smooth"})
        dispatch(fetchUserDetail(userId))
    }, [])


    return (
        <>
            { user === undefined ? null :
                <div>
                    < ReservationPageNavigation/>
                    < ReservationIndexBody user={user} userId={userId}/>
                    <hr></hr>
                    < FutureReservationIndexBody user={user} userId={userId} />        
                </div>
              
            }
   
        </>

    )
}