
function Farmer(items) : Customer() constructor {

  _items = items

  _tradeRule = new _Farmer_TradeRule();

  static getName = function() { return "Farmer"; }

  static getSprite = function() { return spr_Farmer; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Afternoon, neighbor. What have you got for me?", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(_tradeRule);
  }

}

function _Farmer_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "I don't think you can hold that much..."; }

  static customerOverflow = function() { return "I don't think I can hold that much..."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "See you on the morrow, neighbor.";
    } else {
      return "Good deal, neighbor!";
    }
  }

  static badTradeMessage = function() { return "Can you do a bit better?"; }

  static rejectionRule = function() {
    return new FarmerRejectionRule();
  }

}
