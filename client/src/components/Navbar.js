import React from 'react';
import {NavLink} from 'react-router-dom';
import {routes} from './Routes';

const Navbar = () => {
  const links = routes.map(({path}) => (
    <NavLink className="nav-item nav-link" to={path}>
      {path.replace(/\/./, path.charAt(1).toUpperCase())}
    </NavLink>
  ));
  return <nav className="navbar justify-content-center">{links}</nav>;
};

export default Navbar;
