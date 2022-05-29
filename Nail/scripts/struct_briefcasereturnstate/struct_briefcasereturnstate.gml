
// Gent wants to take a briefcase
function BriefcaseReturnState(followUp) : State() constructor {
  _followUp = followUp;

  static onEnter = function() {
    Customers.summon(new BriefcaseReturnGent(), _BriefcaseReturnState_callback);
  }

  static nextNode = function() {
    return _followUp;
  }

}

function _BriefcaseReturnState_callback(summary) {
  /*
  var items = summary.customerStash;
  // Don't store the knife, ring, or briefcase
  items = Util.filter(items, function(item) {
    var id_ = item.getId();
    if ((id_ == ItemId.KNIFE) || (id_ == ItemId.RING) || (id_ == ItemId.BRIEFCASE)) {
      return false;
    }
    return true;
  });
  ctrl_Decks.storeItems(items);
  */
  ctrl_StateMachine.gotoNextState();
}
