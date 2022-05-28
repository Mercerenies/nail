
function DebugState1() : State() constructor {

  static onEnter = function() {
    Customers.summon(new DebugCustomer(), stateMachineNextState);
  }

  static nextNode = function() {
    return new DebugState2();
  }

}
