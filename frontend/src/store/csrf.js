

const csrfFetch = async (url, options = {}) => {
    options.headers = options.headers || {};

    options.method = options.method || 'GET';


    // if the options.method is not 'GET', then set the "Content-Type" header to
    // "application/json" and the "X-CSRF-Token" header to the value of the 
    // "X-CSRF-Token" cookie
    if (options.method.toUpperCase() !== 'GET') {
        options.headers['Content-Type'] = options.headers['Content-Type'] || 'application/json';
        options.headers['X-CSRF-Token'] = sessionStorage.getItem('X-CSRF-Token');
    }
    
    // call fetch with the url and the updated options hash

    const res = await fetch(url, options);

    // if the response status code is 400 or above, then throw an error with the
    // error being the response
    

    // if the response status code is under 400, then return the response to the
    // next promise chain

    return res;
}

export const restoreCSRF = async () => {
    const response = await csrfFetch("/api/session");
    storeCSRFToken(response);
    return response;
}

export const storeCSRFToken = (response) => {
    const csrfToken = response.headers.get("X-CSRF-Token");
    if (csrfToken) sessionStorage.setItem("X-CSRF-Token", csrfToken);
  
}

export default csrfFetch