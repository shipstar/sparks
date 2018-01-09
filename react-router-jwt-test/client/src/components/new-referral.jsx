import React from 'react'

import Authentication from '../mixins/authentication'

let NewReferral = React.createClass({
  mixins: [Authentication],

  render() {
    return <h1>New Referral</h1>
  }
})

export default NewReferral
