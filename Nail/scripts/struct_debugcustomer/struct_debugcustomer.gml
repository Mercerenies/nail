
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

  static getName = function() { return "Dr. Debug"; }

  static getSprite = function() { return spr_Professor; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hi, I'm Dr. Debug", false));
    obj_DialogueBox.enqueue(new DiaText("I'd like to trade with you.", true));
  }

  static onTradeAttempt = function() {
    // Check sizes.
    switch (Inventory.sizesMakeSense()) {
    case SizeError.PLAYER_CANNOT_CARRY:
      obj_DialogueBox.enqueue(new DiaText("I don't think you can carry that much stuff.", true));
      return;
    case SizeError.CUSTOMER_CANNOT_CARRY:
      obj_DialogueBox.enqueue(new DiaText("I don't think you I carry that much stuff.", true));
      return;
    case SizeError.NONE:
      // Pass through to rest of function.
      break;
    }

    Inventory.doTrade();
    obj_DialogueBox.enqueue(new DiaText("Pleasure doing business.", false));
    obj_DialogueBox.enqueue(customerExitEvent());
  }

}
