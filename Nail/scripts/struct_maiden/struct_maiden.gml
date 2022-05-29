
function Maiden(items) : Customer() constructor {

  _items = items
  introduceSoul(_items, "Maiden's", SOUL_MAIDEN);

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

  static playerValuation = function() { return new _Maiden_Valuator(); }

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

function _Maiden_Valuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    if (itemData.getId() == ItemId.CANDLE) {
      return itemData.getValue() + 1;
    }
    if (itemData.getId() == ItemId.TEAPOT) {
      return itemData.getValue() + 1;
    }
    if (itemData.getId() == ItemId.PLATE) {
      return itemData.getValue() + 1;
    }
    if (itemData.getId() == ItemId.SPOON) {
      return itemData.getValue() + 1;
    }
    if (itemData.getId() == ItemId.FAIRY_WAND) {
      return itemData.getValue() + 1;
    }
    return itemData.getValue();
  }
}
