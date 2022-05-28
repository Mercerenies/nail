
// Abstract base class.
function TradeRule() constructor {

  // ABSTRACT METHODS //

  static playerOverflow = function() {}

  static customerOverflow = function() {}

  static playerValuation = function() {}

  static customerValuation = function() {}

  static departureMessage = function(summary) {}

  static badTradeMessage = function() {}

  // PROVIDED (OVERRIDABLE) METHODS //

  // Returns a RejectionRule (for objects the character does not want)
  static rejectionRule = function() {
    return new NullRejectionRule();
  }

  // Returns a RejectionRule (for objects the character wants to keep)
  static keepRule = function() {
    return new NullRejectionRule();
  }

}
