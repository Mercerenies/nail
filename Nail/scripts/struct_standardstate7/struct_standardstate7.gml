
function StandardState7() : StandardState() constructor {

  static nextNode = function() {
    return new GroupAState(new StandardState8());
  }

}
