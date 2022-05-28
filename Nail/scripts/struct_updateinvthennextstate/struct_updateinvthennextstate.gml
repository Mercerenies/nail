
function UpdateInvThenNextState(pocketIdx) constructor {
  _pocketIndex = pocketIdx;

  static call = function(summary) {
    ctrl_Pockets.updateInv(_pocketIndex);
    ctrl_StateMachine.gotoNextState();
  }

}
