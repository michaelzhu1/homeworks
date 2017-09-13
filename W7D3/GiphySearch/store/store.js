import { createStore, applyMiddleware } from 'redux';
//import both thunk and applyMiddleware from redux and redux-think
import thunk from 'redux-thunk';
import RootReducer from '../reducers/root_reducer';

const configureStore = () => {
  return createStore(RootReducer, applyMiddleware(thunk));
};

export default configureStore;
