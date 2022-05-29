
function DadRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.OREGANO) {
      return new MildRejection("Son, that's not the kind of shop I want you to run.");
    }
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("What on earth is that?!");
    }
    return undefined;
  }

}
