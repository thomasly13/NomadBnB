import React, { useState } from 'react';
import { login } from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { Redirect } from 'react-router-dom';
import './LoginForm.css';


function LoginFormPage() {
    // gives access to dispatch
    const dispatch = useDispatch();

    // finds the current sessionUser
    //question
    const sessionUser = useSelector(state => state.sessions.user);
   

    //states of email and password
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState([]);
  
    if (sessionUser) return <Redirect to="/" />;
  
    const handleSubmit = (e) => {
      e.preventDefault();
      setErrors([]);
      dispatch(login({ email, password }))
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