
// Abstract base class
function ItemData() constructor {
  static getName = function() {}
  static getSprite = function() {}
  static getValue = function() {}
}

function NoItem() : ItemData() constructor {
  // Trivial implementation of a null object that satisfies ItemData. Should not
  // appear in actual gamelpay.
  static getName = function() { return "MissingNo"; }
  static getSprite = function() { return spr_NoItem; }
  static getValue = function() { return 0; }
}

function Nail() : ItemData() constructor {
  static getName = function() { return "Nail"; }
  static getSprite = function() { return spr_Nail; }
  static getValue = function() { return 1; }
}

function Candle() : ItemData() constructor {
  static getName = function() { return "Candle"; }
  static getSprite = function() { return spr_Candle; }
  static getValue = function() { return 1; }
}

function Penny() : ItemData() constructor {
  static getName = function() { return "Penny"; }
  static getSprite = function() { return spr_Penny; }
  static getValue = function() { return 0; }
}
