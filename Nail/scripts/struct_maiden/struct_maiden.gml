
function Maiden(items) : Customer() constructor {

  _items = items

  _tradeRule = new _Maiden_TradeRule();

  static getName = function() { return "Maiden"; }

  static getSprite = function() { return spr_Maiden; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hello, sir, what do you have for sale today?", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(_tradeRule);
  }

}

function _Maiden_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "Are you sure you'll be able to hold all of that?"; }

  static customerOverflow = function() { return "I don't think I can quite carry that much."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Fare thee well, sir.";
    } else {
      return "Thank you, sir. I'll be seeing you.";
    }
  }

  static badTradeMessage = function(summary) { return "Terribly sorry, but can you offer a little more, perhaps?"; }

  static rejectionRule = function() {
    return new MaidenRejectionRule();
  }

}
