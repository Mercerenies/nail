
function OldMaid(items) : Customer() constructor {

  _items = items

  _tradeRule = new _OldMaid_TradeRule();

  static getName = function() { return "Old Maid"; }

  static getSprite = function() { return spr_OldMaid; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("How are you today, young man?", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(_tradeRule);
  }

}

function _OldMaid_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "Don't push yourself too hard, dear."; }

  static customerOverflow = function() { return "I don't have that much strength, dear."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Perhaps tomorrow, dear.";
    } else {
      return "Wonderful! Thank you, dear!";
    }
  }

  static badTradeMessage = function(summary) { return "I'm so sorry, but I don't think that's quite worth it."; }

  static rejectionRule = function() {
    return new OldMaidRejectionRule();
  }

}
