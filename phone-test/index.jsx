import React from 'react'
import MaskedInput from 'react-maskedinput'

window.React = React

const PhoneOptions = React.createClass({
  render() {
    return (
      <div>
        <PhoneMask />
        <PhoneExt />
      </div>
    )
  }
})

const PhoneMask = React.createClass({
  getInitialState() {
    return {
      phone: ''
    }
  },

  submit(e) {
    e.preventDefault()
    console.warn(this.state)
  },

  changeField(e) {
    let stateChange = {}
    stateChange[e.target.name] = e.target.value
    this.setState(stateChange)
  },

  render() {
    return (
      <form onSubmit={this.submit}>
        <MaskedInput style={{ fontSize: 24 }}
                     pattern="111 111-1111 x111"
                     name="phone"
                     onChange={this.changeField} />
        <button type="submit">Submit</button>
      </form>
    )
  }
})

const PhoneExt = React.createClass({
  getInitialState() {
    return {
      phone: '',
      extension: '',
      hasExtension: ''
    }
  },

  submit(e) {
    e.preventDefault()
    console.warn(this.state)
  },

  changeField(e) {
    if (e.target.value.slice(-1) === 'x') {
      this.enableExtension(e)
    } else {
      let stateChange = {}
      stateChange[e.target.name] = e.target.value
      this.setState(stateChange)
    }
  },

  enableExtension(e) {
    e.preventDefault()
    this.setState({ hasExtension: true })
  },

  render() {
    let extField
    if (this.state.hasExtension) {
      extField = <span style={{ fontSize: 24 }}>
        x
        <input size={4}
               style={{ fontSize: 24 }}
               name='extension'
               autoFocus={true}
               value={this.state.extension}
               onChange={this.changeField} />
      </span>
    } else {
      extField = <a href='#' onClick={this.enableExtension}>Ext?</a>
    }

    return (
      <form onSubmit={this.submit}>
        <input style={{ fontSize: 24 }}
               name='phone'
               value={this.state.phone}
               onChange={this.changeField} />
        <span style={{ marginLeft: 5, marginRight: 20 }}>{extField}</span>

        <button type="submit">Submit</button>
      </form>
    )
  }
})


React.render(<PhoneOptions />, document.getElementById('react'))
