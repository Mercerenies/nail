
function StandardState5() : StandardState() constructor {

  static nextNode = function() {
    return new DeadState(); // DEBUG CODE
  }

}
