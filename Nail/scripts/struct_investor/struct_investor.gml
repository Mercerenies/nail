
function Investor(items) : Customer() constructor {

  _items = items

  _tradeRule = new _Investor_TradeRule();

  static getName = function() { return "Investor"; }

  static getSprite = function() { return spr_Investor; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hi there, I'm an investor. If you'll give me some money or gold now, I'll invest it and bring you more money later.", true));
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();
    var success = standardTradeAttempt(_tradeRule);

    // If you gave him extra stuff (i.e. it wasn't an even trade) then
    // try the investment rule.
    var investedValue = _tradeRule.investmentValue(summary);
    if (investedValue > -1) {
      ctrl_GameState.investedValue = investedValue;
    }
  }

}

function _Investor_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "You can't carry that."; }

  static customerOverflow = function() { return "I can't carry that."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (investmentValue(summary) > -1) {
      return "I'll invest it carefully.";
    } else if (summary.isEmptyTrade()) {
      return "Perhaps another day.";
    } else {
      return "Wonderful!";
    }
  }

  static badTradeMessage = function(summary) { return "I fear that deal is not in my professional interests."; }

  static rejectionRule = function() {
    return new InvestorRejectionRule();
  }

  static investmentValue = function(summary) {

    var playerValue = playerValuation().valueOfItems(summary.playerTable);
    var customerValue = customerValuation().valueOfItems(summary.customerTable);

    // If you gave him extra stuff (i.e. it wasn't an even trade) then
    // try the investment rule.
    if ((playerValue > customerValue) || (array_length(summary.customerTable) == 0)) {
      var highestValue = -1;
      for (var i = 0; i < array_length(summary.playerTable); i++) {
        var item = summary.playerTable[i];
        var value = Investment.itemToLevel(item);
        if (value >= highestValue) {
          highestValue = value;
        }
      }
      return highestValue;
    }
    return -1;
  }

}
