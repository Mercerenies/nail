
// Takes a TradeRule as argument. Returns whether the trade went
// through or not.
function standardTradeAttempt(rule) {
  // Check sizes.
  switch (Inventory.sizesMakeSense()) {
  case SizeError.PLAYER_CANNOT_CARRY:
    obj_DialogueBox.enqueue(new DiaText(rule.playerOverflow(), true));
    return false;
  case SizeError.CUSTOMER_CANNOT_CARRY:
    obj_DialogueBox.enqueue(new DiaText(rule.customerOverflow(), true));
    return false;
  case SizeError.NONE:
    // Pass through to rest of function.
    break;
  }

  var summary = Inventory.getSummary();

  // Check to make sure the customer doesn't hate anything in the
  // deal.
  var rejectionRule = rule.rejectionRule();
  for (var i = 0; i < array_length(summary.playerTable); i++) {
    var hateReaction = rejectionRule.getReaction(summary.playerTable[i]);
    if (!is_undefined(hateReaction)) {
      hateReaction.call();
      return false;
    }
  }

  // Check to make sure the customer doesn't love anything in the
  // deal.
  var keepRule = rule.keepRule();
  for (var i = 0; i < array_length(summary.customerTable); i++) {
    var loveReaction = keepRule.getReaction(summary.customerTable[i]);
    if (!is_undefined(loveReaction)) {
      loveReaction.call();
      return false;
    }
  }

  // Check to make sure the deal is in the customer's interests.
  var playerValue = rule.playerValuation().valueOfItems(summary.playerTable);
  var customerValue = rule.customerValuation().valueOfItems(summary.customerTable);
  if (playerValue + rule.getLeniency() < customerValue) {
    obj_DialogueBox.enqueue(new DiaText(rule.badTradeMessage(), true));
    return false;
  }

  Inventory.doTrade();
  obj_DialogueBox.enqueue(new DiaText(rule.departureMessage(summary), false));
  obj_DialogueBox.enqueue(customerExitEvent());
  return true;

}
