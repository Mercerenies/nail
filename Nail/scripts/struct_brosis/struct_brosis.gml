
function BroSis(items) : Customer() constructor {

  _items = items
  introduceSoul(_items, "Brother's", SOUL_BRO);
  introduceSoul(_items, "Sister's", SOUL_SIS);

  _tradeRule = new _BroSis_TradeRule();

  static getName = function() { return "Brother & Sister"; }

  static getSprite = function() { return spr_BroSis; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hi there, Mister. Do you have anything for us today?", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(_tradeRule);
  }

}

function _BroSis_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "Careful, Mister, that's a lot of stuff to hold."; }

  static customerOverflow = function() { return "It's just the two of us, Mister. We can't carry all that."; }

  static playerValuation = function() { return new _BroSis_Valuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Bye!";
    } else {
      return "Gee, thanks, Mister!";
    }
  }

  static badTradeMessage = function(summary) { return "Uhm... is that a good deal?"; }

  static rejectionRule = function() {
    return new BroSisRejectionRule();
  }

}

function _BroSis_Valuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    if (itemData.getId() == ItemId.HORSESHOE) {
      return itemData.getValue() + 1;
    }
    if (itemData.getId() == ItemId.BASEBALL) {
      return itemData.getValue() + 1;
    }
    if (itemData.getId() == ItemId.SPIDER) {
      return itemData.getValue() + 1;
    }
    return itemData.getValue();
  }
}
