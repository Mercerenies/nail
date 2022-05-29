
function GroupBState(followUp) : State() constructor {
  _followUp = followUp;

  static onEnter = function() {

    var summary = Inventory.getSummary();
    var playerValue = 0;
    for (var i = 0; i < array_length(summary.playerStash); i++) {
      playerValue += summary.playerStash[i].getValue();
    }
    if (playerValue == 0) {
      _followUp = new FairyGodmotherState(_followUp);
    }

    ctrl_StateMachine.gotoNextState();
  }

  static nextNode = function() {
    return _followUp;
  }

}
