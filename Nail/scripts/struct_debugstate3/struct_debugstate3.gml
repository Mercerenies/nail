
function DebugState3() : State() constructor {

  static onEnter = function() {
    ctrl_Pockets.onTurnTransition();
    Customers.summonStandard(BroSis, POCKET_BROSIS, new UpdateInvThenNextState(POCKET_BROSIS));
  }

  static nextNode = function() {
    return new DebugState4();
  }

}
