
function GentKeepRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.RING) {
      return new MildRejection("I can't part with the ring, kid. It's important.");
    }
    return undefined;
  }

}
