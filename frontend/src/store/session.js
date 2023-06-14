import csrfFetch from './csrf';


//action Types
const SET_CURRENT_USER = 'session/setCurrentUser';
const REMOVE_CURRENT_USER = 'session/removeCurrentUser';


//action controllers
//login action
const setCurrentUser = (user) => {
    return {
        type: SET_CURRENT_USER,
        payload: user
    };
};

//logout action
const removeCurrentUser = () => {
    return {
        type: REMOVE_CURRENT_USER,
   
    };
};

//csrfSession stuff
const storeCSRFToken = response => {
  const csrfToken = response.headers.get("X-CSRF-Token");
  if (csrfToken) sessionStorage.setItem("X-CSRF-Token", csrfToken);
}

const storeCurrentUser = user => {
  if (user) sessionStorage.setItem("currentUser", JSON.stringify(user));
  else sessionStorage.removeItem("currentUser");
}


//login thunk action controller
export const login = (user) => async (dispatch) => {

    const { email, password } = user;
    debugger
    const response = await csrfFetch('/api/session', {
        method: 'POST',
        body: JSON.stringify({
        email,
        password
        })
    });
    const data = await response.json();
    debugger
    dispatch(setCurrentUser(data.user));
    return response;
};

export const logout = (user) => async (dispatch) => {
    const { email, password } = user;
    const response = await csrfFetch('/api/session', {
        method: 'POST',
        body: JSON.stringify({
        email,
        password
        })
    });
    const data = await response.json();
    dispatch(setCurrentUser(data.user));
    return response;
};


export const restoreSession = () => async dispatch => {
    const response = await csrfFetch("/api/session");
    storeCSRFToken(response);
    const data = await response.json();
    storeCurrentUser(data.user);
    dispatch(setCurrentUser(data.user));
    return response;
};


//question: why do we have this
const initialState = { 
  user: JSON.parse(sessionStorage.getItem("currentUser"))
};

const sessionReducer = (state = initialState, action) => {

    Object.freeze(state) 
    const nextState = {...state};

    switch (action.type) {
        case SET_CURRENT_USER:
            return { nextState, user: action.payload };
        case REMOVE_CURRENT_USER:
            return { nextState, user: null };
        default:
            return nextState;
    }
};

export default sessionReducer;