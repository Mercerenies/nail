
function GroupBState(followUp) : State() constructor {
  _followUp = followUp;

  static onEnter = function() {

    // If the player is penniless, do fairy godmother state.
    var playerValue = Inventory.totalPlayerValue();
    if (playerValue == 0) {
      _followUp = new FairyGodmotherState(_followUp);
    } else {

      // Otherwise, cycle till we find a state that makes sense.
      var done = false;
      while (!done) {
        var eventId = ctrl_Decks.groupB.sample();
        switch (eventId) {
        case GroupB.INVESTOR:
          if (ctrl_GameState.investedValue >= 0) {
            _followUp = new InvestorReturnState(_followUp);
            done = true;
          } else if (_GroupBState_playerHasMoney()) {
            _followUp = new InvestorState(_followUp);
            done = true;
          }
          break;
        case GroupB.SATAN:
          if (ctrl_GameState.playerHasSoul) {
            _followUp = new DevilState(_followUp);
            done = true;
          } else if (!ctrl_GameState.playerWorksForSatan) {
            _followUp = new ContractDevilState(_followUp);
            done = true;
          } else {
            var summary = Inventory.getSummary();
            var countSouls = 0;
            for (var i = 0; i < array_length(summary.playerStash); i++) {
              if (summary.playerStash[i].getId() == ItemId.SOUL) {
                countSouls += 1;
              }
            }
            if (countSouls > 0) {
              _followUp = new CollectorDevilState(_followUp);
              done = true;
            }
          }
          break;
        case GroupB.FAIRY_GODMOTHER:
          _followUp = new FairyGodmotherState(_followUp);
          done = true;
          break;
        case GroupB.GROUP_A:
          _followUp = new GroupAState(_followUp);
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

function _GroupBState_playerHasMoney() {
  var summary = Inventory.getSummary();
  for (var i = 0; i < array_length(summary.playerStash); i++) {
    if (Investment.itemToLevel(summary.playerStash[i]) >= 0) {
      return true;
    }
  }
  return false;
}
