import { defaultInputRanges } from "react-date-range";

const RECEIVE_USER = 'RECEIVE_USER'
const RECEIVE_LISTINGS = 'RECEIVE_LISTINGS'
const RECEIVE_LISTING = 'RECEIVE_LISTING'
const DELETE_RESERVATION = 'DELETE_RESERVATION'
const UPDATE_RESERVATION = 'UPDATE_RESERVATION'

const receiveUser = (payload) => {
    return {
        type: RECEIVE_USER,
        payload: payload
    }
}

export const fetchUserDetail = (userId) => async (dispatch) => {
    const response = await fetch(`/api/users/${userId}`);
    const data = await response.json();
    debugger
    dispatch(receiveUser(data));
}

const userReducer = (state, action) => {
    Object.freeze(state);
    const nextState = {...state};
    switch (action.type) {
        case RECEIVE_USER:
            return {...action.payload.user}
        case DELETE_RESERVATION:
            return {...action.payload.user}
        case UPDATE_RESERVATION:
            return {...action.payload.user}
        case RECEIVE_LISTINGS:
            return {...action.payload.owners}
        case RECEIVE_LISTING:
            nextState[action.payload.owner.id] = action.payload.owner
            return nextState
        default: 
            return nextState;
    }
}

export default userReducer;