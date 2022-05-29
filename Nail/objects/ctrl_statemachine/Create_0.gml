
_state = new DeadState();

gotoNextState = function() {
  gotoState(_state.nextNode());
}

gotoState = function(state) {
  show_debug_message(instanceof(state)); // DEBUG CODE
  _state = state;
  _state.onEnter();
}
