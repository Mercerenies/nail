
function DeadState() : State() constructor {

  static onEnter = function() {}

  static nextNode = function() {
    return self;
  }

}
