
function ContractDevilState(followUp) : State() constructor {
  _followUp = followUp;
  _pocketLogic = new BasePocketLogic(ctrl_ItemLists.devilList, 1);

  static onEnter = function() {
    var items = [];
    _pocketLogic.updateInv(items, ctrl_Pockets.getTargetCount());
    Customers.summon(new ContractDevil(items), _ContractDevilState_callback);
  }

  static nextNode = function() {
    return _followUp;
  }

}

function _ContractDevilState_callback(summary) {
  /*
  var items = summary.customerStash;
  ctrl_Decks.storeItems(items);
  */
  ctrl_StateMachine.gotoNextState();
}
