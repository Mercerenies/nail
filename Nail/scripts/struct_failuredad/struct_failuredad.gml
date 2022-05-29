
function FailureDad() : Customer() constructor {

  _items = []
  introduceSoul(_items, "Dad's", SOUL_DAD);

  static getName = function() { return "Dad"; }

  static getSprite = function() { return spr_Dad; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hey, son, how's the shop doing? Can you show me what you've profited?", true));
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();
    if ((array_length(summary.customerTable) > 0) || (array_length(summary.playerTable) < 1)) {
      obj_DialogueBox.enqueue(new DiaText("Show me what you've profited, son.", true));
    } else {
      Inventory.doTrade();
      obj_DialogueBox.enqueue(new DiaText("Hm... maybe you weren't cut out for this after all...", false));
      obj_DialogueBox.enqueue(endgameEvent(Ending.FAILURE));
    }
  }

  static getTradeButtonIndex = function() {
    var summary = Inventory.getSummary();

    if ((array_length(summary.customerTable) == 0) && (array_length(summary.playerTable) >= 1)) {
      return TradeButtonIndex.SHOW;
    }

    return -1;
  }

}
