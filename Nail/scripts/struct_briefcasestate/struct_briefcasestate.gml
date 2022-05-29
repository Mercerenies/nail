
// Gent wants to give you a briefcase
function BriefcaseState(followUp) : State() constructor {
  _followUp = followUp;

  static onEnter = function() {
    Customers.summon(new BriefcaseGent(), _BriefcaseState_callback);
  }

  static nextNode = function() {
    return _followUp;
  }

}

function _BriefcaseState_callback(summary) {
  var items = summary.customerStash;
  // Don't store the knife or ring
  items = Util.filter(items, function(item) {
    var id_ = item.getId();
    if ((id_ == ItemId.KNIFE) || (id_ == ItemId.RING)) {
      return false;
    }
    return true;
  });
  ctrl_Decks.storeItems(items);
  ctrl_StateMachine.gotoNextState();
}
