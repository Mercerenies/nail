
function FairyGodmotherState(followUp) : State() constructor {
  _followUp = followUp;
  _pocketLogic = new BasePocketLogic(ctrl_ItemLists.fairyGodmotherList, 0);

  static onEnter = function() {
    var items = [];
    _pocketLogic.updateInv(items, ctrl_Pockets.getTargetCount() - 1);
    array_insert(items, 0, new FairyWand());
    Customers.summon(new FairyGodmother(items), _FairyGodmother_callback);
  }

  static nextNode = function() {
    return _followUp;
  }

}

function _FairyGodmother_callback(summary) {
  /*
  var items = summary.customerStash;
  ctrl_Decks.storeItems(items);
  */
  ctrl_StateMachine.gotoNextState();
}
