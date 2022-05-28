
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

  // Check to make sure the customer doesn't hate anything in the
  // deal.
  for (var i = 0; i < array_length(summary.playerTable); i++) {
    var hateMessage = rule.hatesItem(summary.playerTable[i]);
    if (!is_undefined(hateMessage)) {
      obj_DialogueBox.enqueue(new DiaText(hateMessage, true));
      return;
    }
  }

  // Check to make sure the deal is in the customer's interests.
  var playerValue = rule.playerValuation().valueOfItems(summary.playerTable);
  var customerValue = rule.customerValuation().valueOfItems(summary.customerTable);
  if (playerValue < customerValue) {
    obj_DialogueBox.enqueue(new DiaText(rule.badTradeMessage(), true));
    return;
  }

  Inventory.doTrade();
  obj_DialogueBox.enqueue(new DiaText(rule.departureMessage(), false));
  obj_DialogueBox.enqueue(customerExitEvent());

}
