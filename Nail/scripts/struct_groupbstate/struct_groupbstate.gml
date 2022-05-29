
function GroupBState(followUp) : State() constructor {
  _followUp = followUp;

  static onEnter = function() {
    ctrl_StateMachine.gotoNextState(); // DEBUG CODE
  }

  static nextNode = function() {
    return _followUp;
  }

}
