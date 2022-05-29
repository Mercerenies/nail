
// A standard character appears and wants to trade. This is an
// ABSTRACT CLASS as it doesn't override nextNode. This is by design.
function StandardState() : State() constructor {

  static onEnter = function() {
    var stdChar = ctrl_Decks.stdChars.sample();
    stdChar.execute();
  }

}
