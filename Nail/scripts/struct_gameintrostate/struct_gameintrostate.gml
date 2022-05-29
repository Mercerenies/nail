
// Dad shows up and offers you the nail
function GameIntroState() : State() constructor {

  static onEnter = function() {
    Customers.summon(new GameIntroDad(), _GameIntroState_callback);
  }

  static nextNode = function() {
    return new StandardState1();
  }

}

function _GameIntroState_callback(summary) {
  //ctrl_Decks.storeItems(summary.customerStash); // It's just a penny; let it go
  ctrl_StateMachine.gotoNextState();
}
