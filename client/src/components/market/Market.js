import React from 'react';
import Card from './Card';

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

const Market = () => (
  <div className="card-deck m-auto">
    {creatures.map((creature, i) => (
      <Card key={i} {...creature} />
    ))}
  </div>
);

export default Market;
