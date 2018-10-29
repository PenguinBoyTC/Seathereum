import React from 'react';
import Banner from './components/Banner';
import Navbar from './components/Navbar';
import routes from './routes';
import {Switch, Route, Redirect} from 'react-router-dom';

const App = () => (
  <>
    <Banner />
    <Navbar />
    <Switch>
      {routes.map((route, i) => (
        <Route key={i} {...route} />
      ))}
      <Redirect from="*" to="/" />
    </Switch>
  </>
);

export default App;
