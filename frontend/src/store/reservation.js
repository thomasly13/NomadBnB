import csrfFetch from "./csrf"

const RECEIVE_USER = 'RECEIVE_USER'
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

const reservationReducer = (state, action) => {
    Object.freeze(state);
    const nextState = {...state};

    switch (action.type) {
        case RECEIVE_USER:
            nextState['previousReservations'] = action.payload.reservations.previousReservations;
            nextState['futureReservations'] = action.payload.reservations.futureReservations;
            return nextState
        default: 
            return nextState
    }
}

export default reservationReducer;