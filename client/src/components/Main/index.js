import React, { Component } from 'react'
import { Switch, Route, Redirect, withRouter } from 'react-router-dom'

import Home from '../Home'


class Main extends Component {

  render() {
    return (
      <div>
        <Switch>
          <Route path="/home" component={Home} />
          <Redirect to="/home" />
        </Switch>
      </div>
    )
  }
}


export default withRouter(Main);
