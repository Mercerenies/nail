
function President() : Customer() constructor {

  // TODO Football
  _items = [new Briefcase(), new GoldBar(), new Earth()]
  introduceSoul(_items, "President's", SOUL_PRESIDENT);

  static getName = function() { return "President"; }

  static getSprite = function() { return spr_President; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    Inventory.suggestTrade([ItemId.CHEST], [ItemId.EARTH]);
    obj_DialogueBox.enqueue(new DiaText("Hello there. I understand you've made quite a bit of money.", false));
    obj_DialogueBox.enqueue(new DiaText("I've been authorized by the United Nations to offer you rights to planet earth.", true));
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();

    var traded = false;
    traded = standardTradeAttempt(new _President_TradeRule());

    if (traded) {
      summary = Inventory.getSummary();
      var playerHasRing = false;
      for (var i = 0; i < array_length(summary.playerStash); i++) {
        if (summary.playerStash[i].getId() == ItemId.EARTH) {
          playerHasRing = true;
        }
      }
      if (playerHasRing) {
        endgameEvent(Ending.TYCOON).trigger(obj_DialogueBox);
      }
    }

  }

  static getTradeButtonIndex = function() {
    var summary = Inventory.getSummary();

    for (var i = 0; i < array_length(summary.customerTable); i++) {
      if (summary.customerTable[i].getId() == ItemId.EARTH) {
        return TradeButtonIndex.BUY;
      }
    }

    return -1;
  }

}

function _President_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "You'll need somewhere to put it."; }

  static customerOverflow = function() { return "I'll need somewhere to put it."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Perhaps another day then. Good day.";
    } else {
      return "Congratulations!";
    }
  }

  static badTradeMessage = function(summary) { return "I believe the price is a bit higher than that."; }

  static rejectionRule = function() {
    return new PresidentRejectionRule();
  }

}
