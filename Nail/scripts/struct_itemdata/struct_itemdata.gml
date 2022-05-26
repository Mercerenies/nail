
// Abstract base class
function ItemData() constructor {
  static getName = function() {}
  static getSprite = function() {}
}

function NoItem() : ItemData() constructor {
  // Trivial implementation of a null object that satisfies ItemData. Should not
  // appear in actual gamelpay.
  static getName = function() { return "MissingNo"; }
  static getSprite = function() { return spr_NoItem; }
}

function Nail() : ItemData() constructor {
  static getName = function() { return "Nail"; }
  static getSprite = function() { return spr_Nail; }
}
