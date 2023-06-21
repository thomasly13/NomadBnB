import React from 'react';
import { Route, Switch } from "react-router-dom";
import { FrontPageBody } from './components/FrontPage/Body/Body.js';
import { ListingShow } from './components/ShowPage/ShowPage.js';
import "./index.css"





//app component
function App() {
  return (
    <div className="App">
      
      <Switch>
        <Route path="/listings/:listingId">
          <ListingShow/>
        </Route>
        <Route path="/">
          <FrontPageBody />
        </Route>
      </Switch>

    </div>

  );
}

export default App;
