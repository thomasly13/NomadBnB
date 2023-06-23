import React, { useEffect } from 'react';
import { Route, Switch } from "react-router-dom";
import { FrontPageBody } from './components/FrontPage/Body/Body.js';
import { ListingShow } from './components/ShowPage/ShowPage.js';
import "./index.css"
import { useDispatch } from 'react-redux';






//app component
function App() {
  

  return (
    <div className="App">
      
      <Switch>
        <Route exact path="/listings/:listingId">
          <ListingShow/>
        </Route>
        <Route exact path="/">
          <FrontPageBody />
        </Route>
      </Switch>

    </div>

  );
}

export default App;
