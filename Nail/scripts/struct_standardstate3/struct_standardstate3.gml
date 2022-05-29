
function StandardState3() : StandardState() constructor {

  static nextNode = function() {
    return new BriefcaseState(new StandardState4());
  }

}
