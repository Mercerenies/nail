
function DebugState2() : State() constructor {

  static onEnter = function() {
    ctrl_Pockets.onTurnTransition();
    Customers.summonStandard(OldMaid, POCKET_OLDMAID, new UpdateInvThenNextState(POCKET_OLDMAID));
  }

  static nextNode = function() {
    return new DebugState3();
  }

}
