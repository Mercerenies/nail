
// Dad shows up and wants the nail back
function FailureState() : State() constructor {

  static onEnter = function() {
    Customers.summon(new FailureDad(), _FailureState_callback);
  }

  static nextNode = function() {
    // Should not occur, but if it does, just repeat this event!
    return self;
  }

}

function _FailureState_callback(summary) {
  ctrl_Decks.storeItems(summary.customerStash);
  ctrl_StateMachine.gotoNextState();
}
