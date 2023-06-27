import csrfFetch from "./csrf"

const RECEIVE_USER = 'RECEIVE_USER'
const CREATE_RESERVATION = 'CREATE_RESERVATION'
const DELETE_RESERVATION = 'DELETE_RESERVATION'
const UPDATE_RESERVATION = 'UPDATE_RESERVATION'
const RECEIVE_LISTINGS = 'RECEIVE_LISTINGS'
const CREATE_REVIEW = 'CREATE_REVIEW'
const EDIT_REVIEW = 'EDIT_REVIEW'
const DELETE_REVIEW = 'DELETE_REVIEW'

const createReservation = (reservation) => {
    return {
        type: CREATE_RESERVATION,
        reservation
    }
}
const deleteReservation = (payload) => {

    return {
        type: DELETE_RESERVATION,
        payload
    }
}

const updateReservation = (payload) => {
    return {
        type: UPDATE_RESERVATION,
        payload
    }
}

export const updateExistingReservation = (reservationDetails) => async(dispatch) => {
    const {numOfGuests, checkInDate, checkOutDate, listingId, id, renterId} = reservationDetails;

    const response = await csrfFetch(`/api/reservations/${id}`, {
        method: 'PATCH',
        body: JSON.stringify({
            numOfGuests: numOfGuests,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            listingId: listingId,            
        })
    })

    
    const data = await response.json();
    dispatch(updateReservation(data))
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


export const deleteExistingReservation = (reservationId, userId) => async (dispatch) => {
    const response = await csrfFetch(`/api/reservations/${reservationId}`, {
        method: 'DELETE',
        body: JSON.stringify({
            userId
        })
    });

    const data = await response.json();
    dispatch(deleteReservation(data))
}

const reservationReducer = (state, action) => {
    Object.freeze(state);
    const nextState = {...state};
    switch (action.type) {
        case RECEIVE_USER:
            nextState['previousReservations'] = action.payload.reservations.previousReservations;
            nextState['futureReservations'] = action.payload.reservations.futureReservations;
            return nextState
        case DELETE_RESERVATION:
            nextState['previousReservations'] = action.payload.reservations.previousReservations;
            nextState['futureReservations'] = action.payload.reservations.futureReservations;
            return nextState
        case UPDATE_RESERVATION:
            nextState['previousReservations'] = action.payload.reservations.previousReservations;
            nextState['futureReservations'] = action.payload.reservations.futureReservations;
            return nextState
        case CREATE_REVIEW:
            nextState['previousReservations'] = action.payload.reservations.previousReservations;
            nextState['futureReservations'] = action.payload.reservations.futureReservations;
        case EDIT_REVIEW: 
            nextState['previousReservations'] = action.payload.reservations.previousReservations;
            nextState['futureReservations'] = action.payload.reservations.futureReservations;
        case DELETE_REVIEW:
            nextState['previousReservations'] = action.payload.reservations.previousReservations;
            nextState['futureReservations'] = action.payload.reservations.futureReservations;           
        default: 
            return nextState
    }
}

export default reservationReducer;