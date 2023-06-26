import { ReservationIndexBody } from "./Body/ReservationIndexBody"
import { ReservationPageNavigation } from "./Navigation/ReservationPageNavigation"
import { useParams } from "react-router-dom";
import { useSelector, useDispatch} from "react-redux";
import { useEffect} from "react";
import { fetchUserDetail } from "../../store/user";


export const ReservationIndex = () => {
    const {userId} = useParams();
    const dispatch = useDispatch();

    const user = useSelector(state => state.user[userId])
    
    let reservations;
    if (user) {
        reservations = Object.values(user.reservations)
    }

    useEffect(() => {
        window.scrollTo({top: 0, left:0 , behavior: "smooth"})
        dispatch(fetchUserDetail(userId))
    }, [])


    return (
        <>
            { user === undefined ? null :
                <div>
                    < ReservationPageNavigation/>
                    < ReservationIndexBody reservations={reservations}/>                  
                </div>
              
            }
   
        </>

    )
}