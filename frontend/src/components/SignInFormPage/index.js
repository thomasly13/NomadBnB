import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import { login, signin, signup } from "../../store/session";
import "./SignIn.css"



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


    // state of error messages
    const [errors, setErrors] = useState({});

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
      if (res.errors.length > 0){
        setErrors({password: res.errors})
      } else {
        setErrors({})
      }
      
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
        setErrors([]);
        const res = await dispatch(signup({ email, firstName, lastName, password }))

        const resErrors = await res.errors
        if (resErrors.first_name) {
          setErrors({...errors}, errors.firstName = "First name is required.")
        };
        if (resErrors.last_name) {
          setErrors({...errors}, errors.lastName = "Last name is required.")};
        if (resErrors.password) {
          setErrors({...errors}, errors.password = "Password is required.")};
        



    };

    const handleDemoSignIn = async () => {
      setTimeout(()=> {
        setEmail("d")
      }, 200);
      setTimeout(()=> {
        setEmail("de")
      }, 400);
      setTimeout(()=> {
        setEmail("dem")
      }, 600);
      setTimeout(()=> {
        setEmail("demo")
      }, 800);
      setTimeout(()=> {
        setEmail("demo@")
      }, 1000);
      setTimeout(()=> {
        setEmail("demo@u")
      }, 1200);
      setTimeout(()=> {
        setEmail("demo@us")
      }, 1400);
      setTimeout(()=> {
        setEmail("demo@use")
      }, 1600);
      setTimeout(()=> {
        setEmail("demo@user")
      }, 1800);
      setTimeout(()=> {
        setEmail("demo@user.")
      }, 2000);
      setTimeout(()=> {
        setEmail("demo@user.c")
      }, 2200);
      setTimeout(()=> {
        setEmail("demo@user.co")
      }, 2400);
      setTimeout(()=> {
        setEmail("demo@user.com")
      }, 2600);

      setTimeout( () => {
        dispatch(login({ email: "demo@user.com" , password: "password" }))}, 2700)
    };

    
    const SignUpFirstNameError = ({errors}) => {
      return (
        <div className="sign-up-first-name-error">
          <div  style={{ color: "#c13515", fontSize: "16px" }}>
            <i className="fa-sharp fa-solid fa-circle-exclamation"></i>
          </div>
          <div >
            <span className="sign-up-error">{errors.firstName}</span>  
          </div>
        </div>
      )
    }

    const SignUpLastNameError = ({errors}) => {
      return (
        <div className="sign-up-last-name-error">
          <div  style={{ color: "#c13515", fontSize: "16px" }}>
            <i className="fa-sharp fa-solid fa-circle-exclamation"></i>
          </div>
          <div >
            <span className="sign-up-error">{errors.lastName}</span>        
          </div>
        </div>
      )
    }

    const SignUpPasswordError = ({errors}) => {
      return (
        <div className="sign-up-password-error">
          <div  style={{ color: "#c13515", fontSize: "16px" }}>
            <i className="fa-sharp fa-solid fa-circle-exclamation"></i>
          </div>
          <div >
            <span className="sign-up-error">{errors.password}</span>        
          </div>
        </div>
      )
    }



    const SignUpNameError = ({errors}) => {
      return (
        <>
          {errors.firstName ? < SignUpFirstNameError errors={errors}/> : null}
          {errors.lastName ? < SignUpLastNameError errors={errors}/> : null}
        </>
      )
    }


    const NewSignUpPage = ({errors}) => {
        return (<div className="sign-up-page">
          <div className="sign-up-header">
            <h2>Finish signing up</h2>
          </div>

          <hr className="sign-up-form-line"></hr>

          <div className="sign-up-form-container">
            <form onSubmit={handleNewSignUp}>
              <div className="sign-up-name-container">
                <div className="sign-up-first-name-label">
                  <label>
                    <div className="sign-up-first-name-input">
                      <input
                          type="text"
                          value={firstName}
                          placeholder="First name"
                          onChange={(e) => setFirstName(e.target.value)}
                      />
                    </div>
                  </label>
                </div>
                <hr className="sign-up-name-line"></hr>
                <div className="sign-up-last-name-label">
                  <label>
                    <div className="sign-up-last-name-input">
                      <input
                          type="text"
                          value={lastName}
                          placeholder="Last name"
                          onChange={(e) => setLastName(e.target.value)}
                      />
                    </div>
                  </label>
                </div>
              </div>
              { (errors.firstName || errors.lastName) ? <SignUpNameError errors={errors}/> : <div className="sign-up-name-message">Make sure it matches the name on your government ID.</div> }
              <div className="sign-up-email-container">
                <div className="sign-up-email-label">
                  <label>
                    <div className="sign-up-email-input">
                      <input
                          type="text"
                          value={email}
                          placeholder="Email"
                          onChange={(e) => setEmail(e.target.value)}
                      />
                    </div>
                  </label>
                </div> 
                <div className="sign-up-email-message">We'll email you trip confirmations and receipts.</div>               
              </div>

              <div className="sign-up-password-label">
                <label>
                  <div className="sign-up-password-input">
                    <input
                        type="password"
                        value={password}
                        placeholder="Password"
                        onChange={(e) => setPassword(e.target.value)}
                    />
                  </div>
                </label>
              </div>

              { errors.password ? < SignUpPasswordError errors={errors}/> : null}
              <div className="contract-div">By selecting Agree and continue, I agree to Airbnb’s Terms of Service, Payments Terms of Service, and Nondiscrimination Policy and acknowledge the Privacy Policy.</div>
              <button className="sign-up-submit-button" type="submit">
                <span>Agree and continue</span> 
              </button>

            </form>  
          </div>
    
        </div>   
      )}

    


    const emailSignInPage = (
        <div className="email-sign-in-page">
          <div className="email-sign-in-header">
            <h2>Log in or sign up </h2>
          </div>
          
          <hr className="email-sign-in-form-line"></hr>

          <div className="email-sign-in-form-container"> 
            <form onSubmit={handleEmailSignInSubmit}>
                <h2>Welcome to Nomadbnb</h2>  
                <div className="email-sign-in-form-label">
                  <label>
                    <div className="email-sign-in-form-input">
                      <input
                          type="email"
                          value={email}
                          placeholder="Email"
                          onChange={(e) => setEmail(e.target.value)}
                          required
                      />  
                    </div>
                  </label>
                </div>
                <button className="email-submit-button"type="submit">
                  <span>Continue</span>
                </button>

                
            </form> 

          </div>
          <h2 className="or-line-block"><span>or</span></h2>

          <button className="demo-login-button" onClick={handleDemoSignIn}>
            <span>Log in with Demo</span>
          </button>

     
        </div>
      )

    const SignInErrors = () => {
      return (
        <div className="errors-container">
          <div className="errorLogo" style={{ color: "#c13515", fontSize: "44px" }}>
            <i class="fa-sharp fa-solid fa-circle-exclamation"></i>
          </div>
          <div className="error-messages">
            <span className="sign-in-bold">Let's try that again</span>
            <span className="sign-in-error">{errors.password}</span>        
          </div>
            
        </div>

      )
    }

    

    const existingSignInPage = (
        <div className="sign-in-page">
          <div className="sign-in-header">
            <h2>Log in</h2>
          </div>

          <div className="sign-in-form-container"> 
            <form onSubmit={handleExistingSignInSubmit}>
              {errors.password ? < SignInErrors /> : null}

              <div className="sign-in-form-label">
                <label>
                  <div className="sign-in-form-input">
                    <input
                        type="password"
                        value={password}
                        placeholder="Password"
                        onChange={(e) => setPassword(e.target.value)}
                        required
                    />  
                  </div>

                </label>
              </div>  

              <button className="sign-in-submit-button" type="submit">
                <span>Login</span>
              </button>
              
            </form>
          </div>


        </div>    
      )

    

    
    const renderForm = () => {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
      if (currentForm === 'Email Sign In') {
        return emailSignInPage
      }
      else if (currentForm === 'Sign In') {
        return existingSignInPage
      }
      else {
        return <NewSignUpPage errors={errors}/>
      };
    }
      
    return (
      <>
        {renderForm()}
      </>

    );
}

//TODO an exit for the email sign in page
//TODO a back for the sign-in and sign-up page
//TODO proper dropdown menu


export default SignInFormPage;