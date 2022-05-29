
function CheckInDad(items) : Customer() constructor {

  _items = items

  _tradeRule = new _CheckInDad_TradeRule();

  static getName = function() { return "Dad"; }

  static getSprite = function() { return spr_Dad; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hiya, son. Just checking to see how you're doing.", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(_tradeRule);
  }

}

function _CheckInDad_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "Don't overwork yourself, son."; }

  static customerOverflow = function() { return "I can't carry that, son."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "See you later, son.";
    } else {
      return "You're doing great, son!";
    }
  }

  static badTradeMessage = function() { return "Now, I can't just give you everything for free."; }

  static rejectionRule = function() {
    return new DadRejectionRule();
  }

  static getLeniency = function() {
    return 1;
  }

}
