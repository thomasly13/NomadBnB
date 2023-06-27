import csrfFetch from "./csrf"

const RECEIVE_LISTING = 'RECEIVE_LISTING'
const RECEIVE_USER = 'RECEIVE_USER'


const reviewReducer = (state, action) => {
    Object.freeze(state);
    const nextState = {...state};


    switch (action.type) {
        case RECEIVE_LISTING:
            return {...action.payload.reviews};
        case RECEIVE_USER:
            return {...action.payload.reviews}
        default:
            return nextState;
    }
}

export default reviewReducer;