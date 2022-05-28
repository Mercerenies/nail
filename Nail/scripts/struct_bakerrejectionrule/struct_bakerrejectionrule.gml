
function BakerRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.SPIDER) {
      return new MildRejection("You'll never catch anything like that in MY food!");
    }
    return undefined;
  }

}
