
function PersonState(followUp, person) : State() constructor {
  _followUp = followUp;
  _person = person;

  static onEnter = function() {
    Customers.summon(_person, _PersonState_callback);
  }

  static nextNode = function() {
    return _followUp;
  }

}

function _PersonState_callback(summary) {
  ctrl_StateMachine.gotoNextState();
}
