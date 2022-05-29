
function StandardState5() : StandardState() constructor {

  static nextNode = function() {
    return new DadCheckState(new StandardState6());
  }

}
