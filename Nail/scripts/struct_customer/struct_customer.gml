
// Abstract base class
function Customer() constructor {

  // ABSTRACT //

  static getName = function() { return ""; }

  static getSprite = function() { return spr_NoItem; }

  // Should return an array of ItemData.
  static getItems = function() { return []; }

  static onIntroduce = function() {}

  static onTradeAttempt = function() {}

  // VIRTUAL BUT HAS DEFAULT //

  // Takes the pre-trade summary object
  static onDepart = function(summary) {}

  // Can be overridden if default is grammatically incorrect.
  static getPossessiveName = function() { return getName() + "'s"; }

  // Returns -1 if the default trade interface should be used, or a
  // TradeButtonIndex constant to override.
  static getTradeButtonIndex = function() {
    return -1;
  }

}
