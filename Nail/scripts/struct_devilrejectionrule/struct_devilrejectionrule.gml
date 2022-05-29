
function DevilRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() != ItemId.SOUL) {
      return new MildRejection("I HAVE NO INTEREST IN MATERIAL POSSESSIONS, MORTAL.");
    }
    return undefined;
  }

}
