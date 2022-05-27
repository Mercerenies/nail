
function DebugCustomer() : Customer() constructor {

  _items = [
    new Nail(),
    new Candle(),
    new Candle(),
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
    Inventory.doTrade();
    obj_DialogueBox.enqueue(new DiaText("Pleasure doing business.", true));
  }

}
