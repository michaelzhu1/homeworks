import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

//my own imports
// import {fetchSearchGiphys} from './util/api_util';

import {fetchSearchGiphys} from './actions/giphy_actions';
import {receiveSearchGiphys} from './actions/giphy_actions';


/* This is the general pattern for rendering React components
    1. createStore
    2. create a hook to html, usually by an id
    3. use ReactDOM.render to render the root component in the hook form html
*/
document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});


// FOR TESTING:
