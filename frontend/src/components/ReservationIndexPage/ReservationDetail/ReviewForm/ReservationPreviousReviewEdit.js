import { useDispatch,  useSelector} from "react-redux"
import { useState} from "react"
import { deleteExistingReview, editExistingReview } from "../../../../store/review";

export const ReservationPreviousEdit = ({reservation, review}) => {

    const dispatch = useDispatch();
   

    const [rating, setRating] = useState(review ? review.rating : 1);

    const [body, setBody] = useState(review ? review.body : "");

    const handleEdit = async (e) => {
        e.preventDefault();
        const revBody = {
            body: body,
            rating: rating,
            listingId: reservation.listingId,
            reservationId: reservation.id,
            id: reservation.reviewId
        }

        const res = await dispatch(editExistingReview(revBody))
    }

    const handleDelete = async (e) => {
        e.preventDefault();

        dispatch(deleteExistingReview(reservation.reviewId))
    }

    return (
        <>
            <form onSubmit={handleEdit}>
                <span className="rate-your-stay">Rate your Stay</span>
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
                    <span>Edit Review</span> 
                </button> 

            </form>
            <button onClick={handleDelete} className="reservation-edit-button" >
                <span>Delete Review</span> 
            </button> 
        </>
    )
}