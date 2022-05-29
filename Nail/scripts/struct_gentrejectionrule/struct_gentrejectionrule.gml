
function GentRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("I don't deal in that kind of business.");
    }
    return undefined;
  }

}
