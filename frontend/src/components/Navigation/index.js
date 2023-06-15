import { logout } from "../../store/session";
import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux';
import './Navigation.css';
import LoginFormModal from "../LoginFormModal";
import SignupFormModal from "../SignupModal";
import { ProfileButton } from "./ProfileButton";



export const Navigation = () => {

    //create dispatch
    const dispatch = useDispatch();

    //finds current user
    const sessionUser = useSelector(state => state.session.user);

    //sends a request to log out of the current user
    const handleLogOut = (e) => {
        dispatch(logout());
    }

    //helper function to handle to show logout if user is logged in
    const LoggedInNav = () => {
        return (
            <button onClick={handleLogOut}>logout</button>
        )
    }

    //helper function to handle to show login and signup if user is logged out
    const LoggedOutNav = () => {
        return (
            <>
                <li><LoginFormModal /></li>
                <li><SignupFormModal/></li>
            </>

        )
    }

    // variable to hold components
    let sessionLinks;

    // saves component depending whether or not user is logged in or not
    if (sessionUser) {
        sessionLinks = <LoggedInNav/>
    } else {
        sessionLinks = <LoggedOutNav/>
    }

    return (
        <>
            <ul>
                <ProfileButton />
                <NavLink exact to="/">Home</NavLink>
                {sessionLinks}
            </ul>
        </>

    );
};

