import React, { useState } from 'react';
import { login } from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { Redirect } from 'react-router-dom';
import './LoginForm.css';


function LoginFormPage() {
    // gives access to dispatch
    const dispatch = useDispatch();

    // finds the current user
    const sessionUser = useSelector(state => state.session.user);
   

    //states of email and password
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    //state of error messages
    const [errors, setErrors] = useState([]);

    //return to home if user is logged in
    if (sessionUser) return <Redirect to="/" />
      
    //handle submit form
    const handleSubmit = async (e) => {
      //stops instant refresh from form submit
      e.preventDefault();

      //calls thunk action and gets a response
      const res = await dispatch(login({ email, password }))
      //sets errors to any errors the response gets
      setErrors(res.errors)
    }
  
    return (
      <form onSubmit={handleSubmit}>
        <ul>
          {errors.map(error => <li key={error}>{error}</li>)}
        </ul>
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
        <button type="submit">Log In</button>
      </form>
    );
  }
  
  export default LoginFormPage;