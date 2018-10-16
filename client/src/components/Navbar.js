import React from 'react';

const Navbar = () => {
  const links = ['Home', 'Market', 'FAQ'].map((link) => {
    return (
      <a className="nav-item nav-link" href="/">
        {link}
      </a>
    );
  });
  return <nav className="navbar justify-content-center">{links}</nav>;
};

export default Navbar;
