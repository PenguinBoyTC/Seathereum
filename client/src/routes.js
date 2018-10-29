import React from 'react';
import Market from './components/market/Market';

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
    render: () => (
      <div align="center">
        <iframe
          src="https://drive.google.com/file/d/1kIUDdWmEf_KLF_cqtOh8LWGXq21otcPK/preview"
          width="640"
          height="480"
          title="video"
          allowFullScreen="true"
          frameBorder="0px"
        />
      </div>
    )
  },
  {
    path: '/creature/:id',
    render: () => <h1 className="display-1 text-center">creature info</h1>
  }
];

export default routes;
