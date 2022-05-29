
function GodfatherRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("I'm not interested in your soul, kid.");
    }
    return undefined;
  }

}
