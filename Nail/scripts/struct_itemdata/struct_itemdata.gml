
// Abstract base class
function ItemData() constructor {
  static getId = function() {}
  static getName = function() {}
  static getSprite = function() {}
  static getValue = function() {}
}

function NoItem() : ItemData() constructor {
  // Trivial implementation of a null object that satisfies ItemData. Should not
  // appear in actual gameplay.
  static getId = function() { return ItemId.NO_ITEM; }
  static getName = function() { return "MissingNo"; }
  static getSprite = function() { return spr_NoItem; }
  static getValue = function() { return 0; }
}

function Nail() : ItemData() constructor {
  static getId = function() { return ItemId.NAIL; }
  static getName = function() { return "Nail"; }
  static getSprite = function() { return spr_Nail; }
  static getValue = function() { return 1; }
}

function Candle() : ItemData() constructor {
  static getId = function() { return ItemId.CANDLE; }
  static getName = function() { return "Candle"; }
  static getSprite = function() { return spr_Candle; }
  static getValue = function() { return 1; }
}

function Penny() : ItemData() constructor {
  static getId = function() { return ItemId.PENNY; }
  static getName = function() { return "Penny"; }
  static getSprite = function() { return spr_Penny; }
  static getValue = function() { return 0; }
}

function Baseball() : ItemData() constructor {
  static getId = function() { return ItemId.BASEBALL; }
  static getName = function() { return "Baseball"; }
  static getSprite = function() { return spr_Baseball; }
  static getValue = function() { return 1; }
}
