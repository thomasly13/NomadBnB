import React from 'react';
import { Route, Switch } from "react-router-dom";
import { NavigationBar } from './components/Navigation/Navigation.js';





//app component
function App() {
  return (
    <div className="App">
      < NavigationBar />
      <Switch>

        <Route path="/">
          <LoginFormPage />
        </Route>
      </Switch>

    </div>

  );
}

export default App;
