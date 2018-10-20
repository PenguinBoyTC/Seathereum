import React from 'react';
import Market from './Market';
import About from './About';
import Home from './Home';
import {Route, Switch} from 'react-router-dom';

export const routes = [
  {
    path: '/home',
    component: Home
  },
  {
    path: '/market',
    component: Market
  },
  {
    path: '/about',
    component: About
  }
];

const Routes = () => {
  return (
    <Switch>
      {routes.map(({path, component}) => (
        <Route path={path} render={component} />
      ))}
    </Switch>
  );
};

export default Routes;
