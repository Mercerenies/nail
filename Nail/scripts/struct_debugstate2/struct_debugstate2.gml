
function DebugState2() : State() constructor {

  static onEnter = function() {
    ctrl_Pockets.onTurnTransition();
    Customers.summonStandard(Professor, POCKET_PROFESSOR, new UpdateInvThenNextState(POCKET_PROFESSOR));
  }

  static nextNode = function() {
    return new DebugState3();
  }

}
