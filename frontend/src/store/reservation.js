import csrfFetch from "./csrf"


const CREATE_RESERVATION = 'CREATE_RESERVATION'

const createReservation = (reservation) => {
    return {
        type: CREATE_RESERVATION,
        reservation
    }
}

export const postCreateReservation = (reservationDetails) => async (dispatch) => {
    const { numOfGuests, checkInDate, checkOutDate, listingId} = reservationDetails;

    const response = await csrfFetch("/api/reservations", {
        method: 'POST',
        body: JSON.stringify({
            numOfGuests: numOfGuests,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            listingId: listingId,
        })
    });
    

    const data = await response.json();
    return data

} 