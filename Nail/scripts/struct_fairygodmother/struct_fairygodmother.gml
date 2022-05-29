
function FairyGodmother(items) : Customer() constructor {

  _items = items
  introduceSoul(_items, "Fairy Godmother's", SOUL_GODMOTHER);

  _tradeRule = new _FairyGodmother_TradeRule();

  static getName = function() { return "Fairy Godmother"; }

  static getSprite = function() { return spr_FairyGodmother; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hello, dear, I'm your fairy godmother. Is there anything you'd like? No cost to you, of course, dear.", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(_tradeRule);
  }

}

function _FairyGodmother_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "You can't carry that much, dear."; }

  static customerOverflow = function() { return "I'm magic, but I'm not that strong, dear."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new FairyGodmotherSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "I'll see you again, dearie.";
    } else {
      return "Bibbidi Bobbidi Boo, dear!";
    }
  }

  static badTradeMessage = function(summary) {
    var hasWand = false;
    for (var i = 0; i < array_length(summary.customerTable); i++) {
      if (summary.customerTable[i].getId() == ItemId.FAIRY_WAND) {
        hasWand = true;
      }
    }
    if (hasWand) {
      return "My wand is very dear to my heart. You'll have to offer a lot more if you want that.";
    } else {
      return "Don't be greedy, now.";
    }
  }

  static rejectionRule = function() {
    return new FairyGodmotherRejectionRule();
  }

  static getLeniency = function() {
    return 1;
  }

}
