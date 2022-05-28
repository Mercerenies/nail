
function DebugCustomer() : Customer() constructor {

  _items = [
    new Nail(),
    new Nail(),
    new Nail(),
    new Nail(),
    new Nail(),
    new Candle(),
    new Candle(),
    new Penny(),
    new Penny(),
  ]

  _tradeRule = new _DebugCustomer_TradeRule();

  static getName = function() { return "Dr. Debug"; }

  static getSprite = function() { return spr_DrDebug; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hi, I'm Dr. Debug", false));
    obj_DialogueBox.enqueue(new DiaText("I'd like to trade with you.", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(_tradeRule);
  }

}

function _DebugCustomer_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "I don't think you can carry that much stuff."; }

  static customerOverflow = function() { return "I don't think I can carry that much stuff."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultValuator(); }

  static departureMessage = function() { return "Pleasure doing business."; }

  static badTradeMessage = function() { return "You'll have to do better than that."; }

  static rejectionRule = function() {
    return new _DebugCustomer_RejectionRule();
  }

}
function _DebugCustomer_RejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.BASEBALL) {
      return new MildRejection("Eek! I'm afraid of baseballs!");
    }
    return undefined;
  }

}
