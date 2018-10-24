import React from 'react';
import Card from './Card';

const creatures = [
  {
    name: 'Pinky',
    desc: 'squishy and sweet',
    id: 1
  },
  {
    name: 'Cephaloquad',
    desc: 'four legs are better than none',
    id: 2
  },
  {
    name: 'Squidward',
    desc: 'best friends with a sponge',
    id: 3
  },
  {
    name: 'Inky',
    desc: 'chases yellow hockey puck',
    id: 4
  }
];

const Market = () => (
  <div className="container card-deck m-auto">
    {creatures.map((creature, i) => (
      <Card key={i} {...creature} />
    ))}
  </div>
);

export default Market;
