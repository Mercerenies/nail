
// Abstract base class
function Customer() constructor {

  static getName = function() { return ""; }

  static getSprite = function() { return spr_NoItem; }

  // Should return an array of ItemData.
  static getItems = function() { return []; }

  // Can be overridden if default is grammatically incorrect.
  static getPossessiveName = function() { return getName() + "'s"; }

}
