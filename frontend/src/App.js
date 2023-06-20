import React from 'react';
import { Route, Switch } from "react-router-dom";
import { NavigationBar } from './components/Navigation/Navigation.js';
import { Body } from './components/Body/Body.js';





//app component
function App() {
  return (
    <div className="App">
      
      <Switch>

        <Route path="/">
          <Body />
        </Route>
      </Switch>

    </div>

  );
}

export default App;
