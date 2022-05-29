
function Baker(items) : Customer() constructor {

  _items = items
  introduceSoul(_items, "Baker's", SOUL_BAKER);

  _tradeRule = new _Baker_TradeRule();

  static getName = function() { return "Baker"; }

  static getSprite = function() { return spr_Baker; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("I hope you're hungry for some pastries!", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(_tradeRule);
  }

}

function _Baker_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "I wouldn't want you to spill anything."; }

  static customerOverflow = function() { return "I can't hold that much stuff!"; }

  static playerValuation = function() { return new _Baker_Valuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Have a good day, sir!";
    } else {
      return "Wonderful! I hope you enjoy it!";
    }
  }

  static badTradeMessage = function(summary) { return "Unfortunately, sir, my prices are a bit higher than that."; }

  static rejectionRule = function() {
    return new BakerRejectionRule();
  }

}

function _Baker_Valuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    return itemData.getValue();
  }
}
