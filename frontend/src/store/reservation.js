import csrfFetch from "./csrf"


const CREATE_RESERVATION = 'CREATE_RESERVATION'

const createReservation = (reservation) => {
    return {
        type: CREATE_RESERVATION,
        reservation
    }
}

export const postCreateReservation = (reservationDetails) => async (dispatch) => {
    debugger
    const response = await csrfFetch("/api/reservations", {
        method: 'POST',
        body: JSON.stringify(reservationDetails)
    });
    const data = await response.json();
    
    return data

} 