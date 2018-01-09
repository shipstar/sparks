import React from 'react'
import DocumentTitle from 'react-document-title'
import { RouteHandler } from 'react-router'
import Nav from './nav'

let Main = React.createClass({
  render () {
    return (
      <DocumentTitle title='HealthPro'>
        <div className='main'>
          <Nav />
          <RouteHandler {...this.props} />
        </div>
      </DocumentTitle>
    );
  }
});

export default Main
