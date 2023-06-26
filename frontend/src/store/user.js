import { defaultInputRanges } from "react-date-range";

const RECEIVE_USER = 'RECEIVE_USER'

const receiveUser = (payload) => {
    return {
        type: RECEIVE_USER,
        payload: payload.user
    }
}

export const fetchUserDetail = (userId) => async (dispatch) => {
    const response = await fetch(`/api/users/${userId}`);
    const data = await response.json();
    dispatch(receiveUser(data));
}

const userReducer = (state, action) => {

    Object.freeze(state);
    const nextState = {...state};

    switch (action.type) {
        case RECEIVE_USER:
            nextState[action.payload.id] = action.payload
            return nextState
        default: 
            return nextState;
    }
}

export default userReducer;