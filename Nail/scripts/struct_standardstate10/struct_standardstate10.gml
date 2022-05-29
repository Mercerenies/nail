
function StandardState10() : StandardState() constructor {

  static nextNode = function() {
    if (ctrl_GameState.mobFavor >= 3) {
      return new PersonState(new StandardState11(), new Godfather());
    } else {
      return new StandardState11();
    }
  }

}
