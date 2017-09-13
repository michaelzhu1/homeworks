import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

//This is a functional component that render all of the app's React components. It receives Redux store as a prop and wrap all of the app's components with the Provider.

const Root = ({store}) => {
  return (
    <Provider store={store}>
      <GiphysSearchContainer />
    </Provider>
  );
};


export default Root;
