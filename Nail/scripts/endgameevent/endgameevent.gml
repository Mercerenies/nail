
// Takes an enum Ending constant
function endgameEvent(endingId) {
  return new DiaEvent(new _endgameEvent_Callback(endingId));
}

function _endgameEvent_Callback(endingId) constructor {
  _endingId = endingId
  static call = function(box) {
    ctrl_PersistentState.lastEndgame = _endingId;
    room_goto(rm_Endgame);
  }
}
