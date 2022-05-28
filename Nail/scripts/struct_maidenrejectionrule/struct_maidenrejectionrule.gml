
function MaidenRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.SPIDER) {
      return new StrongRejection("Eek! A spider! Get it away!");
    }
    return undefined;
  }

}
