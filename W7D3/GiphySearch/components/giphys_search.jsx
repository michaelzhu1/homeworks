import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor() {
    super();
    this.state = {searchTerm: ''};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }



  handleChange(e) {
    this.setState({searchTerm: e.currentTarget.value});
  }


  handleSubmit(e) {
    e.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    console.log('props:', this.props);
    return (
      <div>
        <form>
          <input value={this.state.searchTerm} onChange={this.handleChange}></input>
          <button type="submit" onClick={this.handleSubmit}>Search</button>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
