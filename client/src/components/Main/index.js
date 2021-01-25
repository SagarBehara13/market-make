import React, { Component } from 'react'
import { Switch, Route, Redirect, withRouter } from 'react-router-dom'

import Home from '../Home'
import NavigationBar from '../NavigationBar'


class Main extends Component {

  render() {
    return (
      <div>
        <NavigationBar />
        <Switch>
          <Route path="/home" component={Home} />
          <Redirect to="/home" />
        </Switch>
      </div>
    )
  }
}


export default withRouter(Main);
