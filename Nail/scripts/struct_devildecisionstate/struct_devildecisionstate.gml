
function DevilDecisionState() : State() constructor {

  static onEnter = function() {
    ctrl_StateMachine.gotoNextState();
  }

  static nextNode = function() {
    if (ctrl_GameState.soulsDelivered >= 4) {
      return new PentagramDevilState();
    } else {
      return new StandardState12();
    }
  }

}
