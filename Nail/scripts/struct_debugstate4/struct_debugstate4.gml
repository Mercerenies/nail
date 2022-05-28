
function DebugState4() : State() constructor {

  static onEnter = function() {
    ctrl_Pockets.onTurnTransition();
    Customers.summonStandard(Baker, POCKET_BAKER, new UpdateInvThenNextState(POCKET_BAKER));
  }

  static nextNode = function() {
    return new DebugState2();
  }

}
