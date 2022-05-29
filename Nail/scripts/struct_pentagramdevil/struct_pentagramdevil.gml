
function PentagramDevil(items) : Customer() constructor {

  _items = items
  _items[array_length(_items)] = new PentagramNecklace();

  static getName = function() { return "Devil"; }

  static getSprite = function() { return spr_Devil; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    Inventory.suggestTrade([], [ItemId.NECKLACE]);
    obj_DialogueBox.enqueue(new DiaText("YOU HAVE DONE WELL, MORTAL.", false));
    obj_DialogueBox.enqueue(new DiaText("I OFFER YOU MY NECKLACE AND ALL MY POWER. TOGETHER, WE CAN RULE EVERYTHING.", true));
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();

    var traded = false;
    traded = standardTradeAttempt(new _PentagramDevil_TradeRule());

    if (traded) {
      summary = Inventory.getSummary();
      var playerHasRing = false;
      for (var i = 0; i < array_length(summary.playerStash); i++) {
        if (summary.playerStash[i].getId() == ItemId.NECKLACE) {
          playerHasRing = true;
        }
      }
      if (playerHasRing) {
        endgameEvent(Ending.DARKNESS).trigger(obj_DialogueBox);
      }
    }

  }

  static getTradeButtonIndex = function() {
    var summary = Inventory.getSummary();

    for (var i = 0; i < array_length(summary.customerTable); i++) {
      if (summary.customerTable[i].getId() == ItemId.NECKLACE) {
        return TradeButtonIndex.RULE;
      }
    }

    return -1;
  }

}

function _PentagramDevil_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "YOUR MORTAL HANDS CANNOT CARRY THAT MUCH."; }

  static customerOverflow = function() { return "I CANNOT CARRY THIS MANY SOULS."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new _PentagramDevil_SellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "VERY WELL, MORTAL.";
    } else {
      return "LET US PROCEED, MORTAL.";
    }
  }

  static badTradeMessage = function(summary) { return "THIS WILL NOT SUFFICE."; }

  static rejectionRule = function() {
    return new DevilRejectionRule();
  }

}

function _PentagramDevil_SellValuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    if (itemData.getId() == ItemId.NECKLACE) {
      return 0;
    }
    return itemData.getValue();
  }
}
