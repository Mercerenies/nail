
// Takes a TradeRule as argument.
function standardTradeAttempt(rule) {
  // Check sizes.
  switch (Inventory.sizesMakeSense()) {
  case SizeError.PLAYER_CANNOT_CARRY:
    obj_DialogueBox.enqueue(new DiaText(rule.playerOverflow(), true));
    return;
  case SizeError.CUSTOMER_CANNOT_CARRY:
    obj_DialogueBox.enqueue(new DiaText(rule.customerOverflow(), true));
    return;
  case SizeError.NONE:
    // Pass through to rest of function.
    break;
  }

  var summary = Inventory.getSummary();

  var playerValue = rule.playerValuation().valueOfItems(summary.playerTable);
  var customerValue = rule.customerValuation().valueOfItems(summary.customerTable);

  if (playerValue >= customerValue) {
    Inventory.doTrade();
    obj_DialogueBox.enqueue(new DiaText(rule.departureMessage(), false));
    obj_DialogueBox.enqueue(customerExitEvent());
  } else {
    obj_DialogueBox.enqueue(new DiaText(rule.badTradeMessage(), true));
  }

}
