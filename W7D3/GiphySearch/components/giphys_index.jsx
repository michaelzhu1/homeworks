import React from 'react';

import GiphysIndexItem from './giphys_index_item';


function GiphysIndex({ giphys }) {
  console.log(giphys);
  return (
    <ul>
      {giphys.map(el => <GiphysIndexItem key={el.id} giphy={el} />)}
    </ul>
  );
}

export default GiphysIndex;
