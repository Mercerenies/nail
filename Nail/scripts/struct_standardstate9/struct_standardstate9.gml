
function StandardState9() : StandardState() constructor {

  static nextNode = function() {
    return new GroupBState(new StandardState10());
  }

}
