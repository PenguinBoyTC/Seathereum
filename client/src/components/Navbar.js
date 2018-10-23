import React from 'react';
import {NavLink} from 'react-router-dom';
import {routes} from './Routes';

const Links = () =>
  routes.map(({path, displayAs}, i) => (
    <NavLink key={i} className="nav-item nav-link" to={path}>
      <h5>{displayAs}</h5>
    </NavLink>
  ));

const Navbar = () => (
  <nav className="navbar justify-content-center">
    <Links />
  </nav>
);

export default Navbar;
