import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginFormPage from './components/LoginFormPage/index.js';
import SignupFormPage from './components/SignupFormPage/index.js';
import { ProfileButton } from './components/Navigation/ProfileButton.js';




//app component
function App() {
  return (
    <div className="App">
      < ProfileButton />
      <Switch>
        <Route path="/login">
          <LoginFormPage />
        </Route>
        <Route path="/signup">
          <SignupFormPage />
        </Route>
      </Switch>   
    </div>

  );
}

export default App;
