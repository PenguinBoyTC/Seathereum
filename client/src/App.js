import React, {Component} from 'react';

class App extends Component {
  state = {
    greetings: []
  };
  componentDidMount() {
    fetch('/api')
      .then((res) => res.json())
      .then(({greetings}) => this.setState({greetings}));
  }
  render() {
    // pull greetings out of state using object destructuring
    const {greetings} = this.state;
    // return a random element from greetings array
    return <h1>{greetings[Math.floor(Math.random() * greetings.length)]}</h1>;
  }
}

export default App;
