
function DebugState5() : State() constructor {

  static onEnter = function() {
    ctrl_Pockets.onTurnTransition();
    Customers.summonStandard(Farmer, POCKET_FARMER, new UpdateInvThenNextState(POCKET_FARMER));
  }

  static nextNode = function() {
    return new DebugState2();
  }

}
