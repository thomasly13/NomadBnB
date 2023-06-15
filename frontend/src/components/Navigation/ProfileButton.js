
import { logout } from "../../store/session";
import React, { useState, useEffect } from "react";
import { useSelector, useDispatch } from 'react-redux';
import './Navigation.css'
import { Modal } from "../../context/Modal";
import SignupFormPage from "../SignupFormPage";
import LoginFormPage from "../LoginFormPage";
import SignInFormPage from "../SignInFormPage";






export const ProfileButton = () => {

    //gives access to dispatch
    const dispatch = useDispatch();
    const [showMenu, setShowMenu] = useState(false);
    const [showLoginModal, setShowLoginModal] = useState(false);
    const [showSignupModal, setShowSignupModal] = useState(false);
    const [showModal, setShowModal] = useState(false);
  
    //finds current user
    const sessionUser = useSelector(state => state.session.user);

    //sends a request to log out of the current user
    const handleLogOut = (e) => {
        dispatch(logout());
    }

    //helper component to handle to show logout if user is logged in
    const LoggedInNav = () => {
        return (
            <button onClick={handleLogOut}>logout</button>
        )
    }
    //helper component to handle if logged out components
    const LoggedOutNav = () => {
        return (
            <>  
                {/* if menu is set to true, shows dropdown menu*/}
                {showMenu && (
                <div className="profile-dropdown">
                    <ul>
                        <li><h2 className="signup-dropdown"onClick={() => setShowModal(true)}>Sign Up</h2></li>
                        <li><h2 className="login-dropdown"onClick={() => setShowModal(true)}>Log In</h2></li>
                    </ul>
                </div>
                )} 


                {showModal && (
                    <Modal onClose={() => setShowModal(false)}>
                        <SignInFormPage />
                    </Modal>
                )}
            </>
        )
    }
    // variable to hold components
    let sessionLinks;
    
    // saves component depending whether or not user is logged in or not
    if (sessionUser) {
        sessionLinks = <LoggedInNav/>
    } else {
        sessionLinks = <LoggedOutNav />
    }

    //sets menu to true and opens the profile dropdown menu
    const openMenu = () => {
    if (showMenu) return;
        setShowMenu(true);
    };
  
    //activates whenever the menu boolean changes
    useEffect(() => {
        //if menu is not open, nothing happens
        if (!showMenu) return;

        //function that sets menu to false 
        const closeMenu = () => {
            setShowMenu(false);   
        };
        
        //adds event listener that closes menu if someone clicks anywhere in the page
        document.addEventListener("click", closeMenu);
        return () => document.removeEventListener("click", closeMenu);
    }, [showMenu]);


  return (
    <>

        <div onClick={openMenu} className="profileButton">
            <div className="treeLines" style={{ color: "#595959", fontSize: "16px" }}>
                <i className="fa-solid fa-bars"></i>
            </div>  
            <div className="profilePicture" style={{ color: "#717171", fontSize: "28.69px" }}>
                <i className="fa-sharp fa-solid fa-circle-user"></i>
            </div>  
        </div>
        

        {sessionLinks}
    </>
  );
}
