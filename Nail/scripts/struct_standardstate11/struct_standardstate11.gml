
function StandardState11() : StandardState() constructor {

  static nextNode = function() {
    return new GroupAState(new StandardState12());
  }

}
