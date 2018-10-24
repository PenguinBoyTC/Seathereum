import React from 'react';
import {NavLink} from 'react-router-dom';

const navs = ['Home', 'Market', 'About'].map((name) => ({
  name,
  to: `/${name.toLowerCase()}`
}));

const NavLinks = () =>
  navs.map((nav, i) => (
    <NavLink key={i} className="nav-item nav-link" {...nav}>
      <h5>{nav.name}</h5>
    </NavLink>
  ));

const Navbar = () => (
  <div className="container">
    <nav className="navbar navbar-expand-lg navbar-light justify-content-center">
      <img className="navbar-brand" src="/favicon.ico" alt="Seathereum" />
      <NavLinks />
    </nav>
  </div>
);

export default Navbar;
