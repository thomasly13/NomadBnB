

const RECEIVE_USER = 'RECEIVE_USER'
const RECEIVE_LISTINGS = 'RECEIVE_LISTINGS'
const RECEIVE_LISTING = 'RECEIVE_LISTING'
const DELETE_RESERVATION = 'DELETE_RESERVATION'
const UPDATE_RESERVATION = 'UPDATE_RESERVATION'
const CREATE_REVIEW = 'CREATE_REVIEW'
const EDIT_REVIEW = 'EDIT_REVIEW'
const DELETE_REVIEW = 'DELETE_REVIEW'

const receiveUser = (payload) => {
    return {
        type: RECEIVE_USER,
        payload: payload
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
        case CREATE_REVIEW:
            return {...action.payload.user}
        case EDIT_REVIEW:
            return {...action.payload.user}
        case DELETE_REVIEW: 
            return {...action.payload.user}
        default: 
            return nextState;
    }
}

export default userReducer;