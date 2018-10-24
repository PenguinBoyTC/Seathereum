import React from 'react';
import Market from './market/Market';
import {BrowserRouter, Redirect, Route, Switch} from 'react-router-dom';
import Banner from './Banner';
import Navbar from './Navbar';

const routes = [
  {
    exact: true,
    path: '/',
    render: () => <h1 className="display-1 text-center">home</h1>
  },
  {
    path: '/market',
    render: Market
  },
  {
    path: '/about',
    render: () => <h1 className="display-1 text-center">about</h1>
  },
  {
    path: '/creature/:id',
    render: () => <h1 className="display-1 text-center">creature info</h1>
  }
];

const Router = () => (
  <BrowserRouter>
    <div>
      <Banner />
      <Navbar />
      <Switch>
        {routes.map((route, i) => (
          <Route key={i} {...route} />
        ))}
        <Redirect from="*" to="/" />
      </Switch>
    </div>
  </BrowserRouter>
);

export default Router;
