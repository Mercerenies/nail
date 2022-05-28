
function InventorySummary(playerStash_, playerTable_, customerTable_, customerStash_) constructor {
  playerStash = playerStash_;
  playerTable = playerTable_;
  customerTable = customerTable_;
  customerStash = customerStash_;

  static isEmptyTrade = function() {
    return (array_length(playerTable) == 0) && (array_length(customerTable) == 0);
  }

}
