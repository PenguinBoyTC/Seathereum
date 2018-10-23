import React from 'react';
import {Route, Switch} from 'react-router-dom';
import Market from './market/Market';

export const routes = [
  {
    displayAs: 'Home',
    exact: true,
    path: '/',
    render: () => <h1 className="display-1 text-center">home</h1>
  },
  {
    displayAs: 'Market',
    path: '/market',
    render: Market
  },
  {
    displayAs: 'About',
    path: '/about',
    render: () => <h1 className="display-1 text-center">about</h1>
  }
];

const Routes = () => (
  <Switch>
    {routes.map((route, i) => (
      <Route key={i} {...route} />
    ))}
  </Switch>
);

export default Routes;
