
function DebugState3() : State() constructor {

  static onEnter = function() {
    ctrl_Pockets.onTurnTransition();
    Customers.summonStandard(Maiden, POCKET_MAIDEN, new UpdateInvThenNextState(POCKET_MAIDEN));
  }

  static nextNode = function() {
    return new DebugState4();
  }

}
