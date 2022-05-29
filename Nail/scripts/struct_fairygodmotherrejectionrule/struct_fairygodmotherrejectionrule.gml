
function FairyGodmotherRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("I have no interest in your soul, dearie.");
    }
    return undefined;
  }

}
