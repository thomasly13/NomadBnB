import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import { login, signin, signup } from "../../store/session";




export function SignInFormPage() {

    // gives access to dispatch
    const dispatch = useDispatch();

    //gets the current user
    const sessionUser = useSelector(state => state.session.user);

    //states of credentials
    const [email, setEmail] = useState("");
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [password, setPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");


    // state of error messages
    const [errors, setErrors] = useState([]);

    //current form displaying 

    const [currentForm, setcurrentForm] = useState("Email Sign In");


    //return to home if user is logged in
    if (sessionUser) return <Redirect to="/" />;



    const handleExistingSignInSubmit = async (e) => {
      //stops instant refresh from form submit
      e.preventDefault();

      //calls thunk action and gets a response
      const res = await dispatch(login({ email, password }))
      //sets errors to any errors the response gets
      setErrors(res.errors)
    }

    const handleEmailSignInSubmit = async (e) => {
        //stops the default functionality of a form submit
        e.preventDefault();

        //makes a request to see if the email is in the database
        const res = await dispatch(signin(email))
        if (res === 'Cool') {
          setcurrentForm("Sign In")
        } else {
          setcurrentForm("Sign Up")
        }   
    };

    const handleNewSignUp = async (e) => {
        //stops the default functionality of a form submit
        e.preventDefault();

        //if the password matches confirm password it dispatchs a request
        if (password === confirmPassword) {
            setErrors([]);
            const res = await dispatch(signup({ email, firstName, lastName, password }))
            setErrors(res.errors)
        } else {
            return setErrors(['Confirm Password field must be the same as the Password field']);
        }
    }

    const newSignUpPage = (
        <form onSubmit={handleNewSignUp}>
            <ul>
            {errors.map(error => <li key={error}>{error}</li>)}
            </ul>
            <label>
            First Name
            <input
                type="text"
                value={firstName}
                onChange={(e) => setFirstName(e.target.value)}
                required
            />
            </label>
            <label>
            Last Name
            <input
                type="text"
                value={lastName}
                onChange={(e) => setLastName(e.target.value)}
                required
            />
            </label>
            <label>
            Email
            <input
                type="text"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
            />
            </label>
            <label>
            Password
            <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
            />
            </label>
            <label>
            Confirm Password
            <input
                type="password"
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                required
            />
            </label>
            <button type="submit">Agree and continue</button>
        </form>        
      )

    


    const emailSignInPage = (
        <>
          <h2>Log in or sign up </h2>
          <h2>Welcome to Airbnb</h2>
          <form onSubmit={handleEmailSignInSubmit}>
              <label>
              Email
              <input
                  type="text"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
              />
              </label>
              <button type="submit">Continue</button>
          </form>      
        </>
      )

    

    const existingSignInPage = (
        <>
          <h2>Log in</h2>
          <form onSubmit={handleExistingSignInSubmit}>
              <label>
              Password
              <input
                  type="text"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
              />
              </label>
              <button type="submit">Login</button>
          </form>
          <ul>
            {errors.map(error => <li key={error}>{error}</li>)}
          </ul>
        </>        
      )

    
    let currentView;

    const renderForm = () => {
      // debugger
      if (currentForm === 'Email Sign In') {
        return emailSignInPage
      }
      else if (currentForm === 'Sign In') {
        return existingSignInPage
      }
      else {
        return newSignUpPage
      };
    }
      
    return (
      <>
        {renderForm()}
      </>

    );
}

export default SignInFormPage;