
function OldMaidRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.OREGANO) {
      return new MildRejection("Dear, I have no interest in those things.");
    }
    if (itemData.getId() == ItemId.KNIFE) {
      return new MildRejection("Dear, I have no interest in those things.");
    }
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("Dear, I have no interest in those things.");
    }
    return undefined;
  }

}
