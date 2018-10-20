import React from 'react';
import Banner from './components/Banner';
import Navbar from './components/Navbar';
import Routes from './components/Routes';
import {BrowserRouter as Router} from 'react-router-dom';
const App = () => (
  <Router>
    <div>
      <Banner />
      <Navbar />
      <Routes />
    </div>
  </Router>
);

export default App;
