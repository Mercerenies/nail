
function StandardState2() : StandardState() constructor {

  // 50-50 between StandardState3 and BriefcaseState
  _next = choose(new StandardState3(), new BriefcaseState(new StandardState4()));

  static nextNode = function() {
    return _next;
  }

}
