
function FarmerRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("Hey! Get that thing away from me!");
    }
    return undefined;
  }

}
