import * as APIUtil from "../util/api_util";

export const RECEIVE_SEARCH_GIPHYS = "RECEIVE_SEARCH_GIPHYS";

export const REQUEST_SEARCH_GIPHYS = "REQUEST_SEARCH_GIPHYS";

export const receiveSearchGiphys = giphys => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys
  };
};

/*
very important.. essential for AJAX request by thunk middleware -
it returns a function that takes in dispatch as an argument and calls
fetchSearchGiphys function from APIUtil and then dispatch that response
 wrapped up in the receiveSearchGiphys action. This function used both
 the AJAX call function and the basic action creater to make a new
 'thunk action creator'.
*/

// Is it usual convention to name the AJAS function and thunk action creator the same name?
export const fetchSearchGiphys = searchTerm => {
  return dispatch => {
    APIUtil.fetchSearchGiphys(searchTerm).then(giphys =>
      dispatch(receiveSearchGiphys(giphys.data))
    );
  };
};





/*
Without above method, the test looks something like this
store.getState();
//should return the initial state object, including the empty giphys array

const fetchSuccess = giphys => store.dispatch(receiveSearchGiphys(giphys))
fetchSearchGiphys("puppies").then(fetchSuccess);

store.getState();
// should return the app state populated with puppy giphys


with above method, the test just looks like this:
store.getState(); // should return initial app state
store.dispatch(fetchSearchGiphys("puppies")); //uses the new action creator
store.getState(); // should return the app state populated with giphys
*/
