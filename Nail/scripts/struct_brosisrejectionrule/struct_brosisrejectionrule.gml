
function BroSisRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.OREGANO) {
      return new MildRejection("Uhm... isn't that illegal, mister?");
    }
    if (itemData.getId() == ItemId.KNIFE) {
      return new MildRejection("Whoa, someone could get hurt, mister!");
    }
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("A human soul?! Who are you?!");
    }
    return undefined;
  }

}
