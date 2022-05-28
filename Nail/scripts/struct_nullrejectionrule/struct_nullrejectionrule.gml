
function NullRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    return undefined;
  }

}
