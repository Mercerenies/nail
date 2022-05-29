
function DebugStandardState() : StandardState() constructor {

  static nextNode = function() {
    return new DebugStandardState();
  }

}
