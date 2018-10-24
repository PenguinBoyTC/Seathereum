import React from 'react';
import {Link} from 'react-router-dom';

const Card = ({name, desc, id}) => (
  <Link
    to={`/creature/${id}`}
    className="card btn btn-light border-0 shadow"
    style={{borderRadius: '5%'}}>
    <img className="card-img-top" src="card.png" alt="" />
    <div className="card-body text-center">
      <h3 className="card-title text-primary">{name}</h3>
      <p className="card-text">{desc}</p>
    </div>
  </Link>
);

export default Card;
