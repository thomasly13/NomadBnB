import { useDispatch, useSelector } from "react-redux"
import { useState} from "react"
import { editExistingReview } from "../../../../store/review";
import { deleteExistingReview } from "../../../../store/review";



export const ReservationReviewEdit = ({reservationId, modalFunction}) => {
    const dispatch = useDispatch();
    const reservation = useSelector(state => state.reservation.previousReservations[reservationId])
    
    const listing = useSelector(state => state.listing[reservation.listingId]);

    const review = useSelector(state => state.review[reservation.reviewId])

    const [rating, setRating] = useState(review ? review.rating : 1);

    const [body, setBody] = useState(review ? review.body : "");


    const handleEdit = async (e) => {
        e.preventDefault();

        const revBody = {
            body: body,
            rating: rating,
            listingId: reservation.listingId,
            reservationId: reservationId,
            id: reservation.reviewId
        }

        const res = await dispatch(editExistingReview(revBody))
        modalFunction()
    }

    const handleDelete = async (e) => {
        e.preventDefault();

        const res = await dispatch(deleteExistingReview(reservation.reviewId))
        modalFunction()
    }

    return (
        <>
            { listing === undefined ? null :
                <div className="review-create-container">
                    <div className="reservation-edit-image-container" >
                        <img src={listing.images[0]} className="reservation-edit-image"></img>                           
                    </div>
                    <form onSubmit={handleEdit}>
                        <span>Rate your Stay</span>
                        <div className="review-create-rating-container">
                            <div onClick={() => {setRating(1)}}>
                                {rating > 0 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div> : 
                                <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div>}                        
                            </div>
                            <div onClick={() => {setRating(2)}}>
                                {rating > 1 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div> : 
                                <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div>}                        
                            </div>
                            <div onClick={() => {setRating(3)}}>
                                {rating > 2 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div> : 
                                <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div>}                        
                            </div>
                            <div onClick={() => {setRating(4)}}>
                                {rating > 3 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div> : 
                                <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div>}                        
                            </div>
                            <div onClick={() => {setRating(5)}}>
                                {rating > 4 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div> : 
                                <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div>}                        
                            </div>

                        </div>

                        <input 
                            type="text"
                            value={body}
                            placeholder="How was your experience?"
                            onChange={(e) => setBody(e.target.value)}
                           />

                        <button className="reservation-edit-button" type="submit">
                            <span>Finish Review</span> 
                        </button> 

                    </form>
                    <button onClick={handleDelete} className="reservation-edit-button" >
                            <span>Delete Review</span> 
                    </button> 
  
                </div>
            }  
        </>

    )
}