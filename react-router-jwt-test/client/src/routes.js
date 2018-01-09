import React from 'react' // Why does this need to be imported?
import { Route, DefaultRoute } from 'react-router'

import MainLayout from './layouts/main'

import Login from './components/login'
import NewReferral from './components/new-referral'

export default (
  <Route handler={MainLayout}>
    <Route path='login' handler={Login} />
    <Route path='referrals/new' handler={NewReferral} />

    <DefaultRoute handler={NewReferral} />
  </Route>
)
