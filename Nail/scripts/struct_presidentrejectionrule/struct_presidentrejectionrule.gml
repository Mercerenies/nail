
function PresidentRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("I don't even know what that is.");
    }
    return undefined;
  }

}
