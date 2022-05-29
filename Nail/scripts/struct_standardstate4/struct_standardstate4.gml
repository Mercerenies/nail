
function StandardState4() : StandardState() constructor {

  static nextNode = function() {
    // If the player has only a nail, then we go to failure. Otherwise, we
    // go to standard state 5.
    var summary = Inventory.getSummary();
    if (array_length(summary.playerStash) == 1) {
      if (summary.playerStash[0].getId() == ItemId.NAIL) {
        return new FailureState();
      }
    }
    return new StandardState5();
  }

}
