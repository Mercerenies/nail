
function StandardState12() : StandardState() constructor {

  static nextNode = function() {
    return new GroupBState(new StandardState6());
  }

}
