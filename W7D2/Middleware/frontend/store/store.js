import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
import applyMiddleware from 'redux';

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};


const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState);

  store = applyMiddleware(store,addLoggingToDispatch);

  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
