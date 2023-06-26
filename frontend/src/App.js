import React, { useEffect } from 'react';
import { Route, Switch } from "react-router-dom";
import { FrontPageBody } from './components/FrontPage/Body/Body.js';
import { ListingShow } from './components/ListingShowPage/ShowPage.js';
import "./index.css"
import { useDispatch } from 'react-redux';
import { ReservationIndex } from './components/ReservationIndexPage/ReservationIndex.js';






//app component
function App() {
  

  return (
    <div className="App">
      
      <Switch>
        <Route exact path="/listings/:listingId">
          <ListingShow/>
        </Route>
        <Route exact path="/users/:userId/reservations">
          <ReservationIndex />
        </Route>
        <Route exact path="/">
          <FrontPageBody />
        </Route>
      </Switch>

    </div>

  );
}

export default App;
