
function Godfather() : Customer() constructor {

  _items = [new SkullRing(), new Knife(), new SkullRing(), new Briefcase(), new Briefcase()]
  introduceSoul(_items, "Godfather's", SOUL_GODFATHER);

  static getName = function() { return "Godfather"; }

  static getSprite = function() { return spr_Godfather; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    Inventory.suggestTrade([], [ItemId.RING]);
    obj_DialogueBox.enqueue(new DiaText("Hey, kid, my associate tells me you've been doing good business for us.", false));
    obj_DialogueBox.enqueue(new DiaText("How would you like to join our little organization?", true));
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();

    var traded = false;
    traded = standardTradeAttempt(new _Godfather_TradeRule());

    if (traded) {
      summary = Inventory.getSummary();
      var playerHasRing = false;
      for (var i = 0; i < array_length(summary.playerStash); i++) {
        if (summary.playerStash[i].getId() == ItemId.RING) {
          playerHasRing = true;
        }
      }
      if (playerHasRing) {
        endgameEvent(Ending.RING).trigger(obj_DialogueBox);
      }
    }

  }

  static getTradeButtonIndex = function() {
    var summary = Inventory.getSummary();

    for (var i = 0; i < array_length(summary.customerTable); i++) {
      if (summary.customerTable[i].getId() == ItemId.RING) {
        return TradeButtonIndex.ACCEPT;
      }
    }

    return -1;
  }

}

function _Godfather_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "You're not that strong, kid."; }

  static customerOverflow = function() { return "I don't want all that stuff on me, kid."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new _Godfather_SellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Offer stands on the table if you change your mind.";
    } else {
      return "Welcome to the organization!";
    }
  }

  static badTradeMessage = function(summary) { return "You'll have to do better than that."; }

  static rejectionRule = function() {
    return new GodfatherRejectionRule();
  }

}

function _Godfather_SellValuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    if (itemData.getId() == ItemId.RING) {
      return 0;
    }
    return itemData.getValue();
  }
}
