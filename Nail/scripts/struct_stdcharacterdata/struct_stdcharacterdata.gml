
function StdCharacterData(customerType, pocketIndex) constructor {
  self.customerType = customerType;
  self.pocketIndex = pocketIndex;

  static execute = function() {
    ctrl_Pockets.onTurnTransition();
    Customers.summonStandard(customerType, pocketIndex, new UpdateInvThenNextState(pocketIndex));
  }

}