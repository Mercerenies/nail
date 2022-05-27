
image_speed = 0;

_targetImageIndex = function() {
  var summary = Inventory.getSummary();
  var offeringAny = (array_length(summary.playerTable) > 0);
  var acceptingAny = (array_length(summary.customerTable) > 0);
  if ((!offeringAny) && (!acceptingAny)) {
    return TradeButtonIndex.PASS;
  } else if (!offeringAny) {
    return TradeButtonIndex.TAKE;
  } else if (!acceptingAny) {
    return TradeButtonIndex.GIVE;
  } else {
    return TradeButtonIndex.TRADE;
  }
}
