
function MaidenRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.SPIDER) {
      return new StrongRejection("Eek! A spider! Get it away!");
    }
    if (itemData.getId() == ItemId.OREGANO) {
      return new MildRejection("That's... that's not legal!");
    }
    if (itemData.getId() == ItemId.KNIFE) {
      return new MildRejection("Please don't hurt me!");
    }
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("What are you?! Get that away!");
    }
    return undefined;
  }

}
