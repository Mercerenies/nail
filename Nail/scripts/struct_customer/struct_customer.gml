
// Abstract base class
function Customer() constructor {

  // ABSTRACT //

  static getName = function() { return ""; }

  static getSprite = function() { return spr_NoItem; }

  // Should return an array of ItemData.
  static getItems = function() { return []; }

  static onIntroduce = function() {}

  // VIRTUAL BUT HAS DEFAULT //

  // Can be overridden if default is grammatically incorrect.
  static getPossessiveName = function() { return getName() + "'s"; }

}
