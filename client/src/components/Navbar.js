import React from 'react';
import {NavLink} from 'react-router-dom';
import {routes} from './Routes';

const NavLinks = routes.map(({path, displayAs}, i) => (
  <NavLink key={i} className="nav-item nav-link" to={path}>
    {displayAs}
  </NavLink>
));

const Navbar = () => (
  <nav className="navbar justify-content-center">
    <NavLinks />
  </nav>
);

export default Navbar;
