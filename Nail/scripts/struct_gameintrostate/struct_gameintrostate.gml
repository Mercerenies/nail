
// Dad shows up and offers you the nail
function GameIntroState() : State() constructor {

  static onEnter = function() {
    Customers.summon(new GameIntroDad(), _GameIntroState_callback);
  }

  static nextNode = function() {
    return new DeadState(); // DEBUG CODE
  }

}

function _GameIntroState_callback() {
  // TODO Queue of extra items
  ctrl_StateMachine.gotoNextState();
}
