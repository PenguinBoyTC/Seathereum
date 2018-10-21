import React from 'react';
import {NavLink} from 'react-router-dom';
import {routes} from './Routes';

const Navbar = () => {
  const links = routes.map(({path, displayAs}, i) => (
    <NavLink key={i} className="nav-item nav-link" to={path}>
      {displayAs}
    </NavLink>
  ));
  return <nav className="navbar justify-content-center">{links}</nav>;
};

export default Navbar;
