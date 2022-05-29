
function StandardState1() : StandardState() constructor {

  static nextNode = function() {
    return new StandardState2();
  }

}
