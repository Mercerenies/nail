
// Dad checking in
function DadCheckState(followUp) : State() constructor {
  _followUp = followUp;
  _pocketLogic = new BasePocketLogic(ctrl_ItemLists.commonList);

  static onEnter = function() {
    var items = [];
    _pocketLogic.updateInv(items, ctrl_Pockets.getTargetCount() - 1);
    Customers.summon(new CheckInDad(items), _DadCheckState_callback);
  }

  static nextNode = function() {
    return _followUp;
  }

}

function _DadCheckState_callback(summary) {
  var items = summary.customerStash;
  ctrl_Decks.storeItems(items);
  ctrl_StateMachine.gotoNextState();
}
