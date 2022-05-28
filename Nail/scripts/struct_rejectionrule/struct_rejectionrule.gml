
// Abstract base class.
function RejectionRule() constructor {

  // Returns undefined if the item is acceptable, or a nullary callable to react if
  // not acceptable.
  static getReaction = function(itemData) {
    return undefined;
  }

}
