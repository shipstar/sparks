import SessionStore from '../stores/session'

export default {
  statics: {
    willTransitionTo: function (transition) {
      console.warn(transition)

      if (!SessionStore.loggedIn()) {
        // Login.attemptedTransition = transition;
        transition.redirect('/login');
      }
    }
  }
}
