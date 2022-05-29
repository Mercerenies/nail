
function GroupAState(followUp) : State() constructor {
  _followUp = followUp;

  static onEnter = function() {

    // If the player is penniless, do fairy godmother event.
    var playerValue = Inventory.totalPlayerValue();
    if (playerValue == 0) {
      _followUp = new FairyGodmotherState(_followUp);
    } else {

      // Otherwise, cycle till we find a state that makes sense.
      var done = false;
      while (!done) {
        var eventId = ctrl_Decks.groupA.sample();
        switch (eventId) {
        case GroupA.BRIEFCASE:
          switch (ctrl_GameState.briefcaseState) {
          case BriefcaseState.UNTOUCHED:
            _followUp = new BriefcaseState(_followUp);
            done = true;
            break;
          case BriefcaseState.CARRYING:
            _followUp = new BriefcaseReturnState(_followUp);
            done = true;
            break;
          case BriefcaseState.REFUSED:
            ctrl_GameState.briefcaseState = BriefcaseState.UNTOUCHED;
            break;
          }
          break;
        case GroupA.OREGANO:
          // TODO ////
          break;
        case GroupA.DAD_CHECK:
          _followUp = new DadCheckState(_followUp);
          done = true;
          break;
        }
      }
    }

    ctrl_StateMachine.gotoNextState();
  }

  static nextNode = function() {
    return _followUp;
  }

}
