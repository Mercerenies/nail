
// Abstract base class.
function TradeRule() constructor {

  // ABSTRACT METHODS //

  static playerOverflow = function() {}

  static customerOverflow = function() {}

  static playerValuation = function() {}

  static customerValuation = function() {}

  static departureMessage = function() {}

  static badTradeMessage = function() {}

  // PROVIDED (OVERRIDABLE) METHODS //

  // Returns undefined if the item is acceptable, or a string
  // expressing disgust if not.
  static rejectionRule = function() {
    return new NullRejectionRule();
  }

}
