
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

  // This amount is added to the playerValue before the trade value is
  // calculated. Effectively, this allows a customer to accept a "bad"
  // deal if they like the player.
  static getLeniency = function() {
    return 0;
  }

}
