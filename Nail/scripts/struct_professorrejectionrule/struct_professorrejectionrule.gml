
function ProfessorRejectionRule() : RejectionRule() constructor {

  static getReaction = function(itemData) {
    if (itemData.getId() == ItemId.KNIFE) {
      return new MildRejection("I don't need a weapon.");
    }
    if (itemData.getId() == ItemId.SOUL) {
      return new MildRejection("I study science, sir, not magic.");
    }
    return undefined;
  }

}
