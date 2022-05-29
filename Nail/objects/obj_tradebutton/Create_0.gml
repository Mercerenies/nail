
image_speed = 0;

_targetImageIndex = function() {

  if (instance_exists(obj_Customer)) {
    var data = obj_Customer.getCustomerData();
    if (!is_undefined(data)) {
      var override = data.getTradeButtonIndex();
      if (override >= 0) {
        return override;
      }
    }
  }

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
