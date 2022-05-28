
_state = new DeadState();

gotoNextState = function() {
  gotoState(_state.nextNode());
}

gotoState = function(state) {
  _state = state;
  _state.onEnter();
}