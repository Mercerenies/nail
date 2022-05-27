
function DebugCustomer() : Customer() constructor {

  _items = [
    new Nail(),
    new Candle(),
    new Candle(),
  ]

  static getName = function() { return "Fairy Godmother"; }

  static getSprite = function() { return spr_Professor; }

  static getItems = function() {
    return _items;
  }

}
