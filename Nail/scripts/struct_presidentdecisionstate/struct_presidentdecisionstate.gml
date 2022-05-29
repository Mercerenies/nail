
function PresidentDecisionState() : State() constructor {

  static onEnter = function() {
    ctrl_StateMachine.gotoNextState();
  }

  static nextNode = function() {
    var summary = Inventory.getSummary();
    var hasChest = false;
    for (var i = 0; i < array_length(summary.playerStash); i++) {
      if (summary.playerStash[i].getId() == ItemId.CHEST) {
        hasChest = true;
      }
    }
    if (hasChest) {
      return new PersonState(new StandardState8(), new President());
    } else {
      return new StandardState8();
    }
  }

}
