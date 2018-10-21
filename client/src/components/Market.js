import React from 'react';

const creatures = [
  {
    name: 'Pinky',
    desc: 'squishy and sweet'
  },
  {
    name: 'Cephaloquad',
    desc: 'four legs are better than none'
  },
  {
    name: 'Squidward',
    desc: 'best friends with a sponge'
  }
];

const Card = ({name, desc}) => (
  <div className="card">
    <img className="card-img-top" src="card.jpg" alt="" />
    <div className="card-body text-center">
      <h4 className="card-title">{name}</h4>
      <p className="card-text">{desc}</p>
    </div>
  </div>
);

const Market = () => (
  <div className="market">
    <div className="card-deck m-auto">
      {creatures.map((creature, i) => (
        <Card key={i} {...creature} />
      ))}
    </div>
  </div>
);

export default Market;
