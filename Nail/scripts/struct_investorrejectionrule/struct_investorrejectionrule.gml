
function InvestorRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.OREGANO) {
      return new MildRejection("That's not a legal spice, sir.");
    }
    if (itemData.getId() == ItemId.KNIFE) {
      return new MildRejection("You can't threaten me, sir.");
    }
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("I have no interest in your soul, sir.");
    }
    return undefined;
  }

}
