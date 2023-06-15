import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import { signup } from "../../store/session";
import './SignupForm.css';

function SignupFormPage() {

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


    //return to home if user is logged in
    if (sessionUser) return <Redirect to="/" />;

    const handleSubmit = async (e) => {
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
        
    };

    return (
    <form onSubmit={handleSubmit}>
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
        <button type="submit">Sign Up</button>
    </form>
  );
}

export default SignupFormPage;