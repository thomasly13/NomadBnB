
//action types 

const RECEIVE_LISTINGS = 'RECEIVE_LISTINGS'
const RECEIVE_LISTING = 'RECEIVE_LISTING'


//action controllers

//index action 
const receiveListings = (listings) => {
    return {
        type: RECEIVE_LISTINGS,
        listings
    }
}


//show action 
const receiveListing = (payload) => {

    return {
        type: RECEIVE_LISTING,
        payload
    }
}

//index thunk action
export const fetchAllListings = () => async (dispatch) => {
    const response = await fetch('/api/listings');
    const data = await response.json();
    dispatch(receiveListings(data))
}

//show thunk action
export const fetchListingDetail = (listingId) => async (dispatch) => {
    const response = await fetch(`/api/listings/${listingId}`);
    const data = await response.json();
    dispatch(receiveListing(data[listingId])) ;

}




//listing reducer
const listingReducer = (state, action) => {

    Object.freeze(state) 
    const nextState = {...state};

    switch (action.type) {
        case RECEIVE_LISTINGS:
            return { ...nextState, ...action.listings };
        case RECEIVE_LISTING:
            nextState[action.payload.id] = action.payload
            return nextState
        default:
            return nextState;
    }
};



export default listingReducer;