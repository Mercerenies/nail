
function InvestorReturnState(followUp) : State() constructor {
  _followUp = followUp;
  _pocketLogic = new BasePocketLogic(ctrl_ItemLists.investorList, 0);

  static onEnter = function() {
    var items = [];
    _pocketLogic.updateInv(items, ctrl_Pockets.getTargetCount() - 1);
    Customers.summon(new ReturnInvestor(items, Investment.levelToItem(ctrl_GameState.investedValue + 1)), _InvestorReturnState_callback);
    ctrl_GameState.investedValue = -1;
  }

  static nextNode = function() {
    return _followUp;
  }

}

function _InvestorReturnState_callback(summary) {
  /*
  var items = summary.customerStash;
  ctrl_Decks.storeItems(items);
  */
  ctrl_StateMachine.gotoNextState();
}
