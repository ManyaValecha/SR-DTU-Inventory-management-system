import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

const InventoryItem = ({ item }) => {
  return (
    <li>
      <h2>{item.name}</h2>
      <p>{item.description}</p>
      <p>Quantity: {item.quantity}</p>
    </li>
  );
};

const InventoryList = () => {
  const [items, setItems] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:3000/api/items')
      .then(response => {
        setItems(response.data.data);
      })
      .catch(error => {
        console.error('There was an error fetching the items!', error);
      });
  }, []);

  return (
    <div>
      <h1>Inventory Items</h1>
      <ul>
        {items.map(item => (
          <InventoryItem key={item.id} item={item} />
        ))}
      </ul>
    </div>
  );
};

const HomePage = () => {
  return (
    <div>
      <h1>Home Page</h1>
      <InventoryList />
    </div>
  );
};

const App = () => {
  return (
    <Router>
      <Switch>
        <Route path="/" component={HomePage} exact />
      </Switch>
    </Router>
  );
};

export default App;
