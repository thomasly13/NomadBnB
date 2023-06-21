import React from 'react';
import { Route, Switch } from "react-router-dom";
import { FrontPageBody } from './components/FrontPage/Body/Body.js';





//app component
function App() {
  return (
    <div className="App">
      
      <Switch>
        <Route path="/">
          <FrontPageBody />
        </Route>
      </Switch>

    </div>

  );
}

export default App;
